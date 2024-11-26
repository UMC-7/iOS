//
//  SavedProduct.swift
//  UMC_KREAM
//
//  Created by 윤시진 on 11/7/24.
//

import Foundation

struct SavedProduct {
    let imageName: String
    let description: Description
    let price: Int
}

struct Description {
    let title: String
    let subTitle: String
}

final class SavedProductData {
    static let datalist: [SavedProduct] = [
        SavedProduct(imageName: "1.png", description: Description(title: "손오공이 잃어버린 머리띠 반쪽", subTitle: "손오공이 장난치다가 머리띠 반쪽 잘라서 어딘가 숨겨둔 역사속 물건!!"), price: 942192000),
        SavedProduct(imageName: "2.png", description: Description(title: "골드 반지", subTitle: "결혼 준비하는 당신?! 약혼녀에게 이 반지를 선물하는 건 어때요?!!"), price: 12000),
        SavedProduct(imageName: "3.png", description: Description(title: "하얀 신발", subTitle: "짝퉁 나이키 신발! 정말 푹신푹신해서 걷다가 졸려서 넘어지..."), price: 90000),
        SavedProduct(imageName: "4.png", description: Description(title: "에베레스트 다이아 반지", subTitle: "에베레스트 올라가서 다이아 구하고 만든 반지,,! 과연 이것을 누가 사갈것인가??"), price: 1292999000),
        SavedProduct(imageName: "5.png", description: Description(title: "아디다스다 신발", subTitle: "아디다스 처럼 보이지만 아디다스가 아닐지도 모르는 신발 이 신발의 주인은 너야~~"), price: 120000),
        SavedProduct(imageName: "6.png", description: Description(title: "황제 잠옷", subTitle: "어느 나라의 황제가 입었다던 잠옷 크리스마스 트리같이 보이는 디자인 !!"), price: 120000000),
        SavedProduct(imageName: "7.png", description: Description(title: "고장난 기타", subTitle: "블라블라"), price: 120000),
        SavedProduct(imageName: "8.png", description: Description(title: "하얀 음료", subTitle: "이 음료를 마시면 건강해져요. 근데 어디가 건강해질까요 ? 한번 마셔봐"), price: 120000)
    ]
}
