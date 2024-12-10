//
//  SearchModel.swift
//  practice_7
//
//  Created by 권용빈 on 11/26/24.
//


struct SearchModel: Codable {
    let documents: [DetailDocument]
}

struct DetailDocument: Codable {
    let contestText: String
    let date: String
    let titleText: String
    let urlText: String
    
    enum CodingKeys: String, CodingKey {
        case contestText = "contents"
        case date = "datetime"
        case titleText = "title"
        case urlText = "url"
    }
}
