//
//  TeenipingView.swift
//  Practice_3rd
//
//  Created by 윤시진 on 11/23/24.
//

import UIKit

class TeenipingView: UIView {

    let segmentedControl = UISegmentedControl(items: ["티니핑", "not 티니핑"]).then {
        
    }
    
    let teenipingCollectionView = UICollectionView()
    
    private let divideLine = UIView().then {
        $0.backgroundColor = .black
    }
    private let emptyLabel = UIView().then {
        $0.font = .systemFont(ofSize: 24, weight: .medium)
        $0.textColor = .black
        $0.text = "휑~"
    }
    
    override init(frame:CGRect){
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    required init(color: NSCoder) {
        fatalError("")
    }
    
    private func setupView() {
        segmentedControl,
        teenipingCollectionView,
        divideLine,
        emptyLabel
    }.forEach(addSubview($0))
}
