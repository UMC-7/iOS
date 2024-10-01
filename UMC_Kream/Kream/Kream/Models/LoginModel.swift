//
//  LoginModel.swift
//  Kream
//
//  Created by 권용빈 on 10/1/24.
//

import Foundation

struct LoginModel {
    var id: String
    var password: String
    
    func isValid() -> Bool {
            return !id.isEmpty && !password.isEmpty
        }
}
