//
//  SelectSizeViewController.swift
//  UMC_KREAM
//
//  Created by 윤시진 on 11/25/24.
//

import UIKit

struct ReceivePurchaseData {
    let image: UIImage
    let productName: String
    let prodcutDescription: String
}

/// 사이즈 선택 뷰 컨트롤러
class SelectSizeViewController: UIViewController {
    
    private let data = SizeData.sizeData
    private var selectedSizeIndex: IndexPath?
    var receiveData: ReceivePurchaseData?
    
    private lazy var purchaseSelectSizeView: PurchaseSelectSizeView = {
        let view = PurchaseSelectSizeView()
        view.collectionView.delegate = self
        view.collectionView.dataSource = self
        return view
    }()
    
    override func loadView() {
        self.view = purchaseSelectSizeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupData()
    }
    
    private func setupNavigation() {
        self.navigationItem.title = "구매하기"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "xmark"),
            style: .plain,
            target: self,
            action: #selector(closeView)
        )
    }
    
    private func setupData() {
        if let data = receiveData {
            purchaseSelectSizeView.configure(with: data)
        }
    }
    
    @objc private func closeView() {
        self.dismiss(animated: true)
    }
}

// MARK: - Collection View
extension SelectSizeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SizeCell.identifier, for: indexPath) as? SizeCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: data[indexPath.row])
        cell.updateSelectionState(isSelected: selectedSizeIndex == indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let previousIndex = selectedSizeIndex {
            collectionView.deselectItem(at: previousIndex, animated: true)
        }
        selectedSizeIndex = indexPath
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 47)
    }
}
