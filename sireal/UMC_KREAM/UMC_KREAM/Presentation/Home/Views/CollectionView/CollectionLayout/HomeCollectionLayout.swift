//
//  HomeCollectionLayout.swift
//  UMC_KREAM
//
//  Created by 윤시진 on 11/19/24.
//

import UIKit

/// 홈화면 컬렉션 뷰 --> 각 섹션마다 레이아웃을 설정
class HomeCollectionLayout {
    
    static func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (section, _) -> NSCollectionLayoutSection? in
            switch section {
            case 0:
                // 광고 배너
                return createBannerSection()
            case 1:
                // 추천 상품
                return createRecommendationSection()
            case 2:
                // 상품 그리드
                return createProductGridSection()
            case 3:
                // 사용자 스토리
                return createUserStorySection()
            default:
                return nil
            }
        }
    }
    
    /// 광고 배너
    private static func createBannerSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(336))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(336))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        return section
    }
    

    /// 추천 상품
    private static func createRecommendationSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .absolute(81))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(91))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        group.interItemSpacing = .fixed(8)

        
        let section = NSCollectionLayoutSection(group: group)
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 10, bottom: 30, trailing: 15)
        section.boundarySupplementaryItems = [createFooterItem()]
        
        return section
    }
    
    /// 상품 그리드
    private static func createProductGridSection() -> NSCollectionLayoutSection {

        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(142), heightDimension: .absolute(237))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        

        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(152), heightDimension: .absolute(237))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(8)
        
        let section = NSCollectionLayoutSection(group: group)
        

        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 14, leading: 10, bottom: 30, trailing: 10)
        
        section.boundarySupplementaryItems = [createHeaderItem(), createFooterItem()]
        return section
    }
    
    /// 유저스토리
    private static func createUserStorySection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(124), heightDimension: .absolute(165))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(134), heightDimension: .absolute(165))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(8)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 14, leading: 10, bottom: 30, trailing: 10)
        section.boundarySupplementaryItems = [createHeaderItem(), createFooterItem()]
        
        return section
    }
    

    private static func createFooterItem() -> NSCollectionLayoutBoundarySupplementaryItem {

        let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(1))
        let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerSize, elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
        return footer
    }
    
  
    private static func createHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(45))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        header.pinToVisibleBounds = true
        
        return header
    }
}
