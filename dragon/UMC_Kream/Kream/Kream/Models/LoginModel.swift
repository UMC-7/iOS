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
    
    public func saveUserDefaults() {
        UserDefaults.standard.set(id, forKey: "userID")
        UserDefaults.standard.set(password, forKey: "userPassword")
    }
    
    static func loadUserDefaults() -> LoginModel? {
        guard
            let id = UserDefaults.standard.string(forKey: "userID"),
            let password = UserDefaults.standard.string(forKey: "userPassword")
        else { return nil }
        
        return LoginModel(id: id, password: password)
    }
}
