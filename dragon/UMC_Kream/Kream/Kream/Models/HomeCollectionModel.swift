//
//  HomeCollectionModel.swift
//  Kream
//
//  Created by 권용빈 on 11/11/24.
//

import Foundation
import UIKit

struct HomeCollectionModel {
    let image: UIImage
    let name: String
}

extension HomeCollectionModel {
    static func dummy() -> [HomeCollectionModel] {
        return [
            HomeCollectionModel(image: .shoes1, name: "크림 드로우"),
            HomeCollectionModel(image: .beanie, name: "실시간 차트"),
            HomeCollectionModel(image: .nikeshoes, name: "남성 추천"),
            HomeCollectionModel(image: .clothes, name: "여성 추천"),
            HomeCollectionModel(image: .shoes2, name: "색다른 추천"),
            HomeCollectionModel(image: .wallet, name: "정가 아래"),
            HomeCollectionModel(image: .shoes3, name: "윤세 24AW"),
            HomeCollectionModel(image: .shoes4, name: "올해의 베스트"),
            HomeCollectionModel(image: .bag, name: "10월 베네핏"),
            HomeCollectionModel(image: .doll, name: "아크네 선물")
        ]
    }
}

struct HomeRecommendationModel {
    var imageView: String
    var purchaseCnt: String
    var selectedTag: Bool
    var titleText: String
    var subTitleText: String
    var priceText: String
    var priceSubText: String
}

extension HomeRecommendationModel {
    static func dummy() -> [HomeRecommendationModel] {
        return [
            HomeRecommendationModel(imageView: "recommend1", purchaseCnt: "거래 12.8만", selectedTag: false, titleText: "MLB", subTitleText: "청키라이너 뉴욕양키스", priceText: "139,000원", priceSubText: "즉시 구매가"),
            HomeRecommendationModel(imageView: "recommend2", purchaseCnt: "거래 15.6만", selectedTag: true, titleText: "나이키", subTitleText: "Jordan 1 Retro High OG Yellow", priceText: "228,000원", priceSubText: "즉시 구매가"),
            HomeRecommendationModel(imageView: "recommend3", purchaseCnt: "거래 5.7만", selectedTag: true, titleText: "아디다스", subTitleText: "Human MASEW", priceText: "2,000,000원", priceSubText: "즉시 구매가")
        ]
    }
}

struct UserStoryModel {
    var imageView: String
    var userName: String
}

extension UserStoryModel {
    static func dummy() -> [UserStoryModel] {
        return [
            UserStoryModel(imageView: "story1.pdf", userName: "@katarinabluu"),
            UserStoryModel(imageView: "story2.pdf", userName: "@imwinter"),
            UserStoryModel(imageView: "story3.pdf", userName: "@thousand_wooo"),
        ]
    }
}
