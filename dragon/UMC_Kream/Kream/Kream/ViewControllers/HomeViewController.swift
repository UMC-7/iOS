//
//  HomeViewController.swift
//  Kream
//
//  Created by 권용빈 on 10/6/24.
//

import UIKit

class HomeViewController: UIViewController {

    private let rootView = HomeView()
    
    override func loadView() {
            self.view = rootView // rootView를 view로 설정
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = HomeView()
        
        setupAction()
        setupDelegate()
    }
    
    private func setupAction() {
            rootView.segmentedControl.addTarget(
                self,
                action: #selector(segmentedControlValueChanged(segment:)),
                for: .valueChanged
            )
        }
    private func setupDelegate() {
        rootView.selectCollectionView.dataSource = self
        rootView.selectCollectionView.delegate = self
    }
    
    @objc
    private func segmentedControlValueChanged(segment: UISegmentedControl) {
       // TODO: segment 인덱스에 따라 collectionview 표시 여부 결정
    }

}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return HomeCollectionModel.dummy().count
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: HomeViewCollectionViewCell.identifier,
                    for: indexPath
                ) as? HomeViewCollectionViewCell else {
                    return UICollectionViewCell()
                }
        let list = HomeCollectionModel.dummy()
                
        cell.imageView.image = list[indexPath.row].image
        cell.titleLabel.text = list[indexPath.row].name
        
        return cell
    }
    
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 100) // 원하는 셀 크기 설정
    }
}
