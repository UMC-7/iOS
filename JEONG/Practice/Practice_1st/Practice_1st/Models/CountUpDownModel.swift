//
//  CountUpDownModel.swift
//  Practice_1st
//
//  Created by 정의찬 on 9/24/24.
//

import Foundation

struct CountUpDownModel {
    var count: Int = 1
    
    mutating func inrement() {
        count += 1
    }
    
    mutating func decrement() {
        count -= 1
    }
}
