//
//  SavedModel.swift
//  Kream
//
//  Created by 이은찬 on 11/12/24.
//

import Foundation

struct SavedModel{
    let name: String
    let image: String
    let description: String
    let price: String
    let savedButton: String
}

final class dummySavedModel {
    static let savedDatas: [SavedModel] = [
        SavedModel(name: "손오공이 잃어버린 머리띠 반쪽", image: "Product1", description: "손오공이 장난치다가 머리띠 반쪽 잘라서 어딘가 숨겨둔 역사속 물건!!", price: "942,192,000원", savedButton: "SavedButton"),
        SavedModel(name: "골드 반지", image: "Product2", description: "결혼 준비하는 당신?! 약혼녀에게 이 반지를 선물하는 건 어때요?!", price: "12,000원", savedButton: "SavedButton"),
        SavedModel(name: "하얀 신발", image: "Product3", description: "짝퉁 나이키 신발! 정말 푹신푹신해서 걷다가 졸려서 넘어지...", price: "90,000원", savedButton: "SavedButton"),
        SavedModel(name: "에베레스트 다이아 반지", image: "Product4", description: "에베레스트 올라가서 다이아 구하고 만든 반지,,! 과연 이것을 누가 사갈것인가??", price: "1,292,999,000원", savedButton: "SavedButton"),
        SavedModel(name: "아디다스다 신발", image: "Product5", description: "손아디다스 처럼 보이지만 아디다스가 아닐지도 모르는 신발 이 신발의 주인은 너야~~", price: "120,000원", savedButton: "SavedButton"),
        SavedModel(name: "황제 잠옷", image: "Product6", description: "어느 나라의 황제가 입었다던 잠옷 크리스마스 트리같이 보이는 디자인!", price: "120,000,000원", savedButton: "SavedButton"),
        SavedModel(name: "고장난 기타", image: "Product7", description: "손블라블라블라블라 블라블라블라블라블라", price: "120,000원", savedButton: "SavedButton")
    ]
}
