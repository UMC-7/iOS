//
//  CountUpDownModel.swift
//  practice_1-1
//
//  Created by 권용빈 on 9/24/24.
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
