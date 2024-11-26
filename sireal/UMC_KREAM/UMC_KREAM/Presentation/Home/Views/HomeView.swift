//
//  HomeView.swift
//  UMC_KREAM
//
//  Created by 윤시진 on 11/19/24.
//

import UIKit
import SnapKit

class HomeView: UIView {
    
    //MARK: - 초기화
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addComponents()
        constraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // UICollectionView : 스크롤 가능한 콘텐츠 뷰
    public lazy var homeCollectionView: UICollectionView = {
        
        // 레이아웃 설정을 함수로 분리하여 코드 가독성과 재사용성 증가
        let layout = HomeCollectionLayout.createCompositionalLayout()
        // self.bounds : HomeView 전체 크기 --> 컬렉션 뷰가 HomeView 전체를 덮을 것
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        
        
        collectionView.register(AdBannerCell.self, forCellWithReuseIdentifier: AdBannerCell.identifier)
        collectionView.register(RecommendationCell.self, forCellWithReuseIdentifier: RecommendationCell.identifier)
        collectionView.register(ProductGridCell.self, forCellWithReuseIdentifier: ProductGridCell.identifier)
        collectionView.register(UserStoryCell.self, forCellWithReuseIdentifier: UserStoryCell.identifier)
        
        collectionView.register(SectionSeparatorFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: SectionSeparatorFooter.identifier)
        

        collectionView.register(BaseCellHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: BaseCellHeader.identifier)
        
        collectionView.backgroundColor = .white
        collectionView.refreshControl = refreshControl
        return collectionView
        
    }()
    
    public lazy var homeHeaderView: HomeHeaderView = HomeHeaderView()
    
    
    // pullRefresh 메서드를 연결하여 새로고침 애니매이션 실행
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(pullRefresh), for: .valueChanged)
        return refreshControl
    }()
    
    
    // 1초 후 새로고침 중단
    @objc private func pullRefresh() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            self.refreshControl.endRefreshing()
        })
    }

    
    
    private func addComponents() {
        [homeHeaderView, homeCollectionView].forEach{self.addSubview($0)}
    }
    
    private func constraints() {
        homeHeaderView.snp.makeConstraints{
            $0.top.left.right.equalToSuperview()
        }
        homeCollectionView.snp.makeConstraints{
            $0.top.equalTo(homeHeaderView.snp.bottom).offset(0)
            $0.left.right.bottom.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }

    
}
