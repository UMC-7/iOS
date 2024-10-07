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
        self.view = loginView
    }

    private lazy var loginView: LoginView = {
        let view = LoginView()
        view.loginBtn.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        view.backgroundColor = .white
        return view
    }()
    
    // 로그인 버튼 이벤트
    @objc func loginButtonTapped() {
        let tabBarController = MainTabBarController()
        tabBarController.modalPresentationStyle = .fullScreen
        present(tabBarController, animated: true, completion: nil)
    }
}

