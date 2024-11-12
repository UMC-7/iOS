//
//  ViewController.swift
//  1st_Week
//
//  Created by 이은찬 on 11/1/24.
//

import UIKit

class ViewController: UIViewController {
    
    //CountUpDownModel 타입의 인스턴스를 생성하여 data라는 변수에 할당
    //-> ViewController에서 data변수를 통해 CountUpDownnModel의 기능 사용할 수 있음
    var data: CountUpDownModel = CountUpDownModel(count: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = counterView
    }
    
    private lazy var counterView: CountUpDownView = {
        let view = CountUpDownView()
        view.countLabel.text = String(data.count)
        view.countDownButton.addTarget(self, action: #selector(decreaseCount), for: .touchUpInside)
        view.countUpButton.addTarget(self, action: #selector(increaseCount), for: .touchUpInside)
        
        return view
    }()
    
    @objc func increaseCount() {
        self.data.increaseCount()
        self.updateCount()
    }
    
    @objc func decreaseCount() {
        self.data.decreaseCount()
        self.updateCount()
    }
    
    private func updateCount() {
        self.counterView.countLabel.text = String(data.count)
    }


}

