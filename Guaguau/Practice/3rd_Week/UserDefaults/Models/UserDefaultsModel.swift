//
//  UserDefaultsModel.swift
//  UserDefaults
//
//  Created by 이은찬 on 10/8/24.
//

import Foundation

class UserDefaultsModel {
    private let userDefaults = UserDefaults.standard
    private let userTextKey: String = "userText"
    
    public func saveUserText(_ text: String) {
        userDefaults.set(text, forKey: userTextKey)
    }
    
    public func loadUserText() -> String? {
        return userDefaults.string(forKey: userTextKey)
    }
}
