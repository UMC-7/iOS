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
    
    /// UserDefaults에 저장하는 메서드
    public func saveUserDefaults() {
        UserDefaults.standard.set(id, forKey: "userId")
        UserDefaults.standard.set(password, forKey: "userPassword")
    }
    
    /// UserDefaults에서 회원 아이디, 비밀번호 불러오기
    /// - Returns: 아이디, 비밀번호 반환
    static func loadUserDefaults() -> LoginModel? {
        guard
            let id = UserDefaults.standard.string(forKey: "userId"),
            let password = UserDefaults.standard.string(forKey: "userPassword")
        else {
            return nil
        }
        return LoginModel(id: id, password: password)
    }
    
}
