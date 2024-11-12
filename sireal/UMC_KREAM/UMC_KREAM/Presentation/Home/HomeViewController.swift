//
//  HomeViewController.swift
//  UMC_KREAM
//
//  Created by 윤시진 on 11/7/24.
//

import UIKit

class HomeViewController: UIViewController, UISearchResultsUpdating, UICollectionViewDataSource, UICollectionViewDelegate {

    private let homeView = HomeView()

    // MenuModel을 사용하여 각 셀의 데이터를 정의
    private let menuItems = [
        MenuModel(title: "크림 드로우", imageName: "drow"),
        MenuModel(title: "실시간 차트", imageName: "chart"),
        MenuModel(title: "남성 추천", imageName: "1_recommend"),
        MenuModel(title: "여성 추천", imageName: "2_recommend"),
        MenuModel(title: "색다른 추천", imageName: "3_recommend"),
        MenuModel(title: "정가 아래", imageName: "under"),
        MenuModel(title: "윤세 24AW", imageName: "24AW"),
        MenuModel(title: "올해의 베스트", imageName: "best"),
        MenuModel(title: "10월 베네핏", imageName: "benefit"),
        MenuModel(title: "아크네 선물", imageName: "present")
    ]

    override func loadView() {
        self.view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
        
        // Setup collection view dataSource and delegate
        homeView.collectionView.dataSource = self
        homeView.collectionView.delegate = self

        // 초기 선택: 추천 탭이 선택되도록 설정
        homeView.segmentedControl.selectedSegmentIndex = 0
        updateViewForSelectedSegment()
    }

    private func setupActions() {
        homeView.segmentedControl.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
    }

    @objc private func segmentChanged(_ sender: UISegmentedControl) {
        updateViewForSelectedSegment()
        homeView.updateUnderlinePosition() // 세그먼트 변경 시 밑줄 위치 업데이트
    }

    private func updateViewForSelectedSegment() {
        if homeView.segmentedControl.selectedSegmentIndex == 0 {
            homeView.adImageView.isHidden = false
            homeView.emptyView.isHidden = true
        } else {
            homeView.adImageView.isHidden = true
            homeView.emptyView.isHidden = false
        }
    }

    // MARK: - UISearchResultsUpdating
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text, !searchText.isEmpty else { return }
        print("Searching for: \(searchText)")
    }

    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.identifier, for: indexPath) as? MenuCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        // 메뉴 아이템에서 데이터 가져와 셀에 설정
        let item = menuItems[indexPath.row]
        cell.configure(with: item.title, imageName: item.imageName)
        
        return cell
    }
}
