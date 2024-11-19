//
//  SavedModel.swift
//  Kream
//
//  Created by 이은찬 on 11/12/24.
//

import Foundation

struct SavedProduct{
    let image: String
    let description: Desctiction
    let price: Int
}


struct Desctiction{         //구조체 만들어서 제목과 설명을 한번에 합침
    let title: String
    let subtitle: String
}


final class dummySavedProduct {
    static let savedDatas: [SavedProduct] = [
        SavedProduct(image: "Product1", description: Desctiction(title: "물건1", subtitle: "물건1입니다"), price: 10000000),
        SavedProduct(image: "Product2", description: Desctiction(title: "물건2", subtitle: "물건2입니다"), price: 20000000),
        SavedProduct(image: "Product3", description: Desctiction(title: "물건3", subtitle: "물건3입니다"), price: 30000000),
        SavedProduct(image: "Product4", description: Desctiction(title: "물건4", subtitle: "물건4입니다"), price: 40000000),
        SavedProduct(image: "Product5", description: Desctiction(title: "물건5", subtitle: "물건5입니다"), price: 50000000),
        SavedProduct(image: "Product6", description: Desctiction(title: "물건6", subtitle: "물건6입니다"), price: 60000000),
        SavedProduct(image: "Product7", description: Desctiction(title: "물건7", subtitle: "물건7입니다"), price: 70000000),
        SavedProduct(image: "Product8", description: Desctiction(title: "물건8", subtitle: "물건8입니다"), price: 80000000),
    ]
}
