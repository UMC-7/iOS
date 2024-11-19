//
//  LoginModel.swift
//  1st_Week
//
//  Created by 이은찬 on 9/30/24.
//

import Foundation

struct UserInfo{
    var id: String
    var pw: String
    
    
    //UserDefaults에 저장하는 메서드
    public func saveUserDefaults() {
        UserDefaults.standard.set(id, forKey: "userId")
        UserDefaults.standard.set(pw, forKey: "userPwd")
    }
    
    //UserDefaults에서 이메일, 비번 불러오기
    static func loadUserDefaults() -> UserInfo? {      //? 붙여야함 -> UserDefaults에서 못 불러올 수도 있음
        guard
            let id = UserDefaults.standard.string(forKey: "userId"),
            let pw = UserDefaults.standard.string(forKey: "userPwd")
        else {
            return nil
        }
        return UserInfo(id: id, pw: pw)
    }
}
