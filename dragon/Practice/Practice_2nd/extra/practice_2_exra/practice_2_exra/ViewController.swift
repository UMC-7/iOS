//
//  ViewController.swift
//  practice_2_exra
//
//  Created by 권용빈 on 9/30/24.
//

import UIKit


import Then
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let tempLabel = UILabel().then {
                $0.text = "여러분 안녕하세요\nUMC 7기 iOS 화이팅!"
                $0.textColor = .black
                $0.textAlignment = .center
                $0.numberOfLines = 2
                $0.font = UIFont(name: "Pretendard-Bold", size: 28)
        }

        func setLabel() {
            tempLabel.do {
                $0.textColor = .white
                $0.textAlignment = .left
                $0.numberOfLines = 0
                $0.font = UIFont(name: "Pretendard-Bold", size: 18)
            }
        }
    }


}

