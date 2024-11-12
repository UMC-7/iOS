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
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "브랜드, 상품, 프로필, 태그 등"
        searchBar.searchBarStyle = .minimal
        return searchBar
    }()
    
    private lazy var segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"])
        return control
    }()
    
    private lazy var underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var adImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "image_ad"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var emptyView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.isHidden = true
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
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
