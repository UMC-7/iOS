//
//  ProfileManageViewController.swift
//  Kream
//
//  Created by 이은찬 on 11/12/24.
//

import UIKit

class ProfileManageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = profileManageView

    }
    
    private lazy var profileManageView: ProfileManageView = {
        let view = ProfileManageView()
        
        return view
    }()

}
