//
//  ViewController.swift
//  Kream
//
//  Created by 권용빈 on 10/1/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    //LoginModel 인스턴스 설정
    var loginModel = LoginModel(id: "abcd", password: "1234")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
    }
    
    private lazy var loginView: LoginView = {
        //함수 부분
        let view = LoginView()
        view.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return view
    }()
    
    @objc func loginButtonTapped() {
        loginModel.id = loginView.idTextField.text ?? ""
        loginModel.password = loginView.pwTextField.text ?? ""
        
        if loginModel.isValid() {
            print("로그인 성공")
            goToMainTabBar()
        }else {
            print(" 아이디 또는 비밀번호가 유효하지 않습니다.")
        }
    }
    
    private func goToMainTabBar() {
        let mainTabBarController = MainTabBarController()
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            sceneDelegate.changeRootViewController(mainTabBarController)
        }
    }
    
    
}

