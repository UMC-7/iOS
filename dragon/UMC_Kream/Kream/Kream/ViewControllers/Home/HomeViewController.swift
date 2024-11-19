//
//  HomeViewController.swift
//  Kream
//
//  Created by 권용빈 on 10/6/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let homeView = HomeView()
    
    override func loadView() {
        self.view = homeView // rootView를 view로 설정
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAction()
        setupDelegate()
    }
    
    private func setupAction() {
        homeView.segmentedControl.addTarget(
            self,
            action: #selector(segmentedControlValueChanged(segment:)),
            for: .valueChanged
        )
    }
    private func setupDelegate() {
        homeView.selectCollectionView.dataSource = self
        homeView.selectCollectionView.delegate = self
        homeView.recommendationView.dataSource = self
        homeView.recommendationView.delegate = self
        homeView.storyView.dataSource = self
        homeView.storyView.delegate = self
    }
    
    @objc
    private func segmentedControlValueChanged(segment: UISegmentedControl) {
        // TODO: segment 인덱스에 따라 collectionview 표시 여부 결정
    }
    
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == homeView.selectCollectionView {
            return HomeCollectionModel.dummy().count
        } else if collectionView == homeView.recommendationView {
            return HomeRecommendationModel.dummy().count
        } else if collectionView == homeView.storyView { // storyView 추가
            return UserStoryModel.dummy().count
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == homeView.selectCollectionView {
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
        } else if collectionView == homeView.recommendationView {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RecommendCollectionViewCell.identifier,
                for: indexPath
            ) as? RecommendCollectionViewCell else {
                return UICollectionViewCell()
            }
            let list = HomeRecommendationModel.dummy()
            let item = list[indexPath.row]
            cell.imageView.image = UIImage(named: item.imageView)
            cell.titleText.text = item.titleText
            cell.subTitleText.text = item.subTitleText
            cell.priceLabel.text = item.priceText
            return cell
        } else if collectionView == homeView.storyView { // storyView 추가
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: StoryCollectionViewCell.identifier,
                for: indexPath
            ) as? StoryCollectionViewCell else {
                return UICollectionViewCell()
            }
            let list = UserStoryModel.dummy()
            let item = list[indexPath.row]
            cell.imageView.image = UIImage(named: item.imageView)
            cell.userNameLabel.text = item.userName
            return cell
        }
        return UICollectionViewCell()
    }
}


extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == homeView.selectCollectionView {
            return CGSize(width: 80, height: 100)
        } else if collectionView == homeView.recommendationView {
            return CGSize(width: 142, height: 237)
        } else if collectionView == homeView.storyView {
            return CGSize(width: 124, height: 165)
        }
        return .zero
    }
    
}
