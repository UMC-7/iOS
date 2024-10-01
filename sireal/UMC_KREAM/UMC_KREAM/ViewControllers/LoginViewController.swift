//
//  ViewController.swift
//  UMC_KREAM
//
//  Created by 윤시진 on 9/30/24.
//

import UIKit

import SnapKit

class LoginViewController: UIViewController {

    var loginModel = LoginModel(id: "", pwd: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // showLoginView()
        self.view = loginView
    }

    private lazy var loginView: LoginView = {
        let view = LoginView()
        view.backgroundColor = .white
        return view
    }()
    
    private func showLoginView() {
        view.addSubview(loginView)
        loginView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
}

