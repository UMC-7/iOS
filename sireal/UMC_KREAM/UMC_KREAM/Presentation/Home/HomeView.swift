//
//  HomeView.swift
//  UMC_KREAM
//
//  Created by 윤시진 on 11/10/24.
//

import UIKit
import SnapKit

class HomeView: UIView {

    // MARK: - UI Components
    let searchBar = UISearchBar()
    let segmentedControl = UISegmentedControl(items: ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"])
    let underlineView = UIView()
    let adImageView = UIImageView(image: UIImage(named: "image_ad"))
    let emptyView = UIView()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        layout.itemSize = CGSize(width: 60, height: 85) // 이미지와 텍스트를 포함한 셀 크기 설정

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isScrollEnabled = false // 스크롤 비활성화
        collectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.identifier)
        return collectionView
    }()

    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup UI
    private func setupUI() {
        backgroundColor = .systemBackground
        setupSearchBar()
        addComponents()
        setupConstraints()
    }

    private func setupSearchBar() {
        searchBar.placeholder = "브랜드, 상품, 프로필, 태그 등"
        searchBar.searchBarStyle = .minimal
    }

    private func addComponents() {
        [searchBar, segmentedControl, underlineView, adImageView, collectionView, emptyView].forEach { addSubview($0) }
    }

    private func setupConstraints() {
        searchBar.snp.makeConstraints {
            $0.top.equalToSuperview().offset(51)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-55)
            $0.height.equalTo(40)
        }

        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(40)
        }

        underlineView.backgroundColor = .black
        underlineView.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom).offset(5)
            $0.height.equalTo(2)
            $0.width.equalTo(segmentedControl.frame.width / CGFloat(segmentedControl.numberOfSegments))
            $0.leading.equalTo(segmentedControl.snp.leading)
        }

        adImageView.contentMode = .scaleAspectFill
        adImageView.clipsToBounds = true
        adImageView.snp.makeConstraints {
            $0.top.equalTo(underlineView.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(336)
        }

        collectionView.snp.makeConstraints {
            $0.top.equalTo(adImageView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(200) // 두 줄에 맞는 높이로 설정
        }

        emptyView.backgroundColor = .white
        emptyView.isHidden = true
        emptyView.snp.makeConstraints {
            $0.top.equalTo(underlineView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }

    // MARK: - Update Underline Position
    func updateUnderlinePosition() {
        let segmentWidth = segmentedControl.frame.width / CGFloat(segmentedControl.numberOfSegments)
        let targetX = segmentWidth * CGFloat(segmentedControl.selectedSegmentIndex)
        
        UIView.animate(withDuration: 0.3) {
            self.underlineView.snp.updateConstraints { make in
                make.leading.equalTo(self.segmentedControl.snp.leading).offset(targetX)
            }
            self.layoutIfNeeded()
        }
    }
}
