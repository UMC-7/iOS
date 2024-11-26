//
//  LoginModel.swift
//  UMC_KREAM
//
//  Created by 윤시진 on 11/26/24.
//

import Foundation

struct LoginModel: Codable {
    let accessToken: String
    let refreshToken: String
    let expiresIn: Int
    let scope: String
    let tokenType: String

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
        case expiresIn = "expires_in"
        case scope
        case tokenType = "token_type"
    }
}

