//
//  ViewController.swift
//  Practice_1st
//
//  Created by 정의찬 on 9/23/24.
//

import UIKit

class ViewController: UIViewController {
    
    var data = CountUpDownModel(count: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = CountUpDownView()
    }
    
    private lazy var customView: CountUpDownView = {
        let view = CountUpDownView()
        view.backgroundColor = .white
        view.countLabel.text = String(data.count)
        view.downBtn.addTarget(self, action: #selector(downCount), for: .touchUpInside)
        view.upBtn.addTarget(self, action: #selector(upCount), for: .touchUpInside)
        return view
    }()
    
    @objc func downCount() {
        data.decrement()
        customView.countLabel.text = String(data.count)
    }

    @objc func upCount() {
        data.inrement()
        customView.countLabel.text = String(data.count)
    }

}

