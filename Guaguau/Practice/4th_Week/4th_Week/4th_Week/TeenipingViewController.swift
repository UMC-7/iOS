//
//  File.swift
//  4th_Week
//
//  Created by 이은찬 on 11/5/24.
//

import UIKit
import Then
import SnapKit

class TeenipingViewController: UIViewController {
    
    private let rootView = TeenipingView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = rootView
    }
    
    private func setupAction() {
            rootView.segmentedControl.addTarget(
                self,
                action: #selector(segmentedControlValueChanged(segment:)),
                for: .valueChanged
            )
        }

    @objc
    private func segmentedControlValueChanged(segment: UISegmentedControl) {
        
    }
}
