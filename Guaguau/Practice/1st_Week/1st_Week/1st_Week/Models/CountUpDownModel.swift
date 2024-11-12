//
//  CountUpDownModel.swift
//  1st_Week
//
//  Created by 이은찬 on 11/5/24.
//

struct CountUpDownModel {
    var count: Int = 0
    
    mutating func increaseCount(){
        self.count += 1
    }
    
    mutating func decreaseCount(){
        self.count -= 1
    }
}
