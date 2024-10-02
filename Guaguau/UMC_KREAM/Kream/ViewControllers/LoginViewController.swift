//
//  ViewController.swift
//  1st_Week
//
//  Created by 이은찬 on 9/30/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
    }
    
    private lazy var loginView: LoginView = {
        let view = LoginView()
        
        return view
    }()
}
