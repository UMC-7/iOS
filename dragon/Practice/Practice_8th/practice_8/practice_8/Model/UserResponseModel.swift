//
//  UserResponseModel.swift
//  practice_8
//
//  Created by 권용빈 on 12/3/24.
//

import Foundation

struct UserResponseModel: Codable {
    let id: Int
    let email: String
    let password: String
    let name: String
    let role: String
    let avatar: String
}
