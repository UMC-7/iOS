//
//  TeenipingModel.swift
//  practice_4
//
//  Created by 권용빈 on 11/5/24.
//

import UIKit

struct TeeningModel {
    let image: UIImage
    let name: String
}

extension TeeningModel{
    static func dummy() -> [TeeningModel] {
        return [
            TeeningModel(image: .hachuping, name: "하츄핑"),
            TeeningModel(image: .lalaping, name: "라라핑"),
            TeeningModel(image: .baroping, name: "바로핑"),
            TeeningModel(image: .azaping, name: "아자핑"),
            TeeningModel(image: .chachaping, name: "차차핑"),
            TeeningModel(image: .haeping, name: "해핑"),
            TeeningModel(image: .mugoping, name: "무거핑"),
            TeeningModel(image: .siroping, name: "시로핑")
        ]
    }
}
