//
//  UserDefaultsModel.swift
//  Practice_3rd
//
//  Created by 윤시진 on 11/21/24.
//

import Foundation

class UserDefaultsModel {
    private let userDefaults = UserDefaults.standard
    private let userTextKey: String = "userText"
    
    public func saveUserText(_text: String){
        userDefaults.set(_text, forKey: userTextKey)
    }
    
    public func loadUserText() -> String? {
        return userDefaults.string(forKey: userTextKey)
    }

    
}
