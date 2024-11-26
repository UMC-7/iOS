//
//  HomeHeaderView.swift
//  UMC_KREAM
//
//  Created by 윤시진 on 11/19/24.
//

import UIKit
import SnapKit

// 홈 화면 상단 UI
class HomeHeaderView: UIView {
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        addComponents()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Property
    
    /// 상단 검색 바
    public lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "브랜드, 상품, 프로필, 태그 등"
        searchBar.barTintColor = .white
        searchBar.backgroundColor = .clear
        searchBar.clipsToBounds = true
        searchBar.layer.cornerRadius = 12
        searchBar.backgroundImage = UIImage()
        
        /* 돋보기 아이콘 및 여백 제거 */
        searchBar.searchTextField.leftView = nil
        return searchBar
    }()
    
    /// 상단 벨 아이콘
    private lazy var topBell: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bell.pdf")
        return imageView
    }()
    
    /// 상단 세그먼트 컨트롤
    public lazy var segmentControl: HomeSegmentControl = {
        let items = ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]
        let segmentControl = HomeSegmentControl(items: items)
        segmentControl.selectedSegmentIndex = 0
        return segmentControl
    }()
    
    /// 구분선
    private lazy var bottomBorder: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        return view
    }()
    
    private func addComponents() {
        [searchBar, topBell, segmentControl,bottomBorder].forEach { self.addSubview($0) }
    }
    
    private func constraints() {
        searchBar.snp.makeConstraints {
            $0.top.equalToSuperview().offset(60)
            $0.left.equalTo(16)
            $0.right.equalTo(topBell.snp.left).offset(-15)
        }
        
        topBell.snp.makeConstraints {
            $0.centerY.equalTo(searchBar.snp.centerY)
            $0.right.equalToSuperview().offset(-16)
            $0.width.height.equalTo(24)
        }
        
        segmentControl.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(8)
            $0.left.equalToSuperview().offset(14)
            $0.right.equalToSuperview().offset(-15)
            $0.height.equalTo(27)
        }
        
        bottomBorder.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview()
            $0.top.equalTo(segmentControl.snp.bottom).offset(1)
            $0.height.equalTo(1)
            $0.width.equalToSuperview()
        }
    }

}
