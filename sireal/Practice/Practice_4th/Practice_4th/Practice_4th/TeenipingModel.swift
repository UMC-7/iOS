//
//  TeenipingModel.swift
//  Practice_4th
//
//  Created by 윤시진 on 10/29/24.
//

import UIKit

struct TeenipingModel {
    let image: UIImage
    let name: String
}

extension TeenipingModel {
    static func dummy() -> [TeenipingModel] {
        return [
            TeenipingModel(image: .haeping, name: "해핑"),
            TeenipingModel(image: .azaping, name: "아자핑"),
            TeenipingModel(image: .baroping, name: "바로핑"),
            TeenipingModel(image: .chachaping, name: "차차핑"),
            TeenipingModel(image: .mugoping, name: "무거핑"),
            TeenipingModel(image: .siroping, name: "시러핑"),
            TeenipingModel(image: .hachuping, name: "하츄핑")
        
        ]
    }
}
