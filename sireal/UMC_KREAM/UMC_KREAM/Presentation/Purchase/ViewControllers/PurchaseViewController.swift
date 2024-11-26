//
//  PurchaseViewController.swift
//  UMC_KREAM
//
//  Created by 윤시진 on 11/25/24.
//

//
//  PurchaseViewController.swift
//  UMC_KREAM
//

import UIKit

class PurchaseViewController: UIViewController {
    
    // MARK: - Properties
    
    let data = PurchaseData.purchaseData

    private lazy var purchaseView: PurchaseView = {
        let view = PurchaseView()
        view.productCollectionView.delegate = self
        view.productCollectionView.dataSource = self
        return view
    }()
    
    // MARK: - init

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
        configureDefaultSelection()
        configureGestures()
    }
    
    override func loadView() {
        self.view = purchaseView
    }
    
    // MARK: - Functions

    /// 네비게이션 아이템 설정
    private func configureNavigation() {
        let backButton = UIBarButtonItem(
            image: UIImage(systemName: "arrow.left")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor.black),
            style: .plain,
            target: self,
            action: #selector(handleBackButton)
        )
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    /// 컬렉션 뷰 기본 선택 상태 설정
    private func configureDefaultSelection() {
        let firstIndexPath = IndexPath(item: 0, section: 0)
        updateSelectedImage(for: firstIndexPath)
    }
    
    /// 제스처 추가
    private func configureGestures() {
        let purchaseTapGesture = UITapGestureRecognizer(target: self, action: #selector(handlePurchaseButton))
        purchaseView.leftPurchaseBtn.addGestureRecognizer(purchaseTapGesture)
    }
    
    // MARK: - Action

    /// 네비게이션 뒤로가기
    @objc private func handleBackButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    /// 구매 버튼 클릭 시 사이즈 선택 화면 전환
    @objc private func handlePurchaseButton() {
        let sizeSelectionVC = SelectSizeViewController()
        
        sizeSelectionVC.receiveData = ReceivePurchaseData(
            image: purchaseView.productImageView.image ?? UIImage(),
            productName: purchaseView.productName.text ?? "전달 못했음",
            prodcutDescription: purchaseView.productDescription.text ?? "전달 못했음"
        )
        
        let navigationController = UINavigationController(rootViewController: sizeSelectionVC)
        navigationController.modalPresentationStyle = .pageSheet
        present(navigationController, animated: true, completion: nil)
    }
    
    /// 선택한 이미지 업데이트
    private func updateSelectedImage(for indexPath: IndexPath) {
        purchaseView.productImageView.image = UIImage(named: data[indexPath.item].imageView)
        purchaseView.productDescription.text = data[indexPath.item].productName
    }
}


extension PurchaseViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PurchaseCell.identifier, for: indexPath) as? PurchaseCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(model: data[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        updateSelectedImage(for: indexPath)
    }
}
