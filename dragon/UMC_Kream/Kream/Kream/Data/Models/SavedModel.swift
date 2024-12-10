//
//  SavedModel.swift
//  Kream
//
//  Created by 권용빈 on 11/6/24.
//

import Foundation

struct SavedModel {
    let savedImage: String
    let savedName: String
    let savedText: String
    let savedPrice: Int
}

final class DummySavedModel {
    static let savedModels: [SavedModel] = [
        SavedModel(savedImage: "wukongsHeadband.pdf", savedName: "손오공이 잃어버린 머리띠 반쪽", savedText: "손오공머리띠", savedPrice: 999999),
        SavedModel(savedImage: "goldring.pdf", savedName: "ㄱㄴㅇㄷㄹㅁㅇㄹㄷㅇㄹㅁㄴㅇㄹㅁㅇㄹㅈㄹㅇㄹㅈㄴㄹㅇㄴㅇㄹㅈㄷㄹㅈㅇㄹㅈㅇㄹㅈㅇㄹ", savedText: "금반지", savedPrice: 34343),
        SavedModel(savedImage: "whiteshoes.pdf", savedName: "하얀신발", savedText: "하얗고하얀신발", savedPrice: 232),
        SavedModel(savedImage: "diamondring.pdf", savedName: "다이아몬드 반지", savedText: "갖고싶다", savedPrice: 123456789),
        SavedModel(savedImage: "adidasshoes.pdf", savedName: "ㄱㄴㅇㄷㄹㅁㅇㄹㄷㅇㄹㅁㄴㅇㄹㅁㅇㄹㅈㄹㅇㄹㅈㄴㄹㅇㄴㅇㄹㅈㄷㄹㅈㅇㄹㅈㅇㄹㅈㅇㄹ", savedText: "나이키가 더 좋음", savedPrice: 69990),
        SavedModel(savedImage: "kingspajama", savedName: "왕의 잠옷", savedText: "갖고싶다", savedPrice: 999999),
        SavedModel(savedImage: "diamondring", savedName: "ㄱㄴㅇㄷㄹㅁㅇㄹㄷㅇㄹㅁㄴㅇㄹㅁㅇㄹㅈㄹㅇㄹㅈㄴㄹㅇㄴㅇㄹㅈㄷㄹㅈㅇㄹㅈㅇㄹㅈㅇㄹ", savedText: "갖고싶다", savedPrice: 123456789),
        SavedModel(savedImage: "brokenguitar.pdf", savedName: "ㄱㄴㅇㄷㄹㅁㅇㄹㄷㅇㄹㅁㄴㅇㄹㅁㅇㄹㅈㄹㅇㄹㅈㄴㄹㅇㄴㅇㄹㅈㄷㄹㅈㅇㄹㅈㅇㄹㅈㅇㄹ", savedText: "갖고싶다", savedPrice: 123456789)
        ]
}
