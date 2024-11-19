//
//  ViewController.swift
//  practice_5
//
//  Created by 권용빈 on 11/12/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = RainbowView(frame: self.view.bounds)
    }
}
