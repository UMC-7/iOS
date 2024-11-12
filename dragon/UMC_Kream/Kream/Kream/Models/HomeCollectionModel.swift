//
//  HomeCollectionModel.swift
//  Kream
//
//  Created by 권용빈 on 11/11/24.
//

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
