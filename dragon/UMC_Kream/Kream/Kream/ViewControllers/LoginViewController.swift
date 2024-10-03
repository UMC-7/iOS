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
    var loginView: LoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = LoginView(frame: self.view.bounds)
        
        loginView = LoginView()
        self.view.addSubview(loginView)
        
        loginView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    @objc func loginButtonTapped() {
        loginModel.id = loginView.idTextField.text ?? ""
        loginModel.password = loginView.pwTextField.text ?? ""
        
        if loginModel.isValid() {
            print("로그인 성공")
        }else {
            print(" 아이디 또는 비밀번호가 유효하지 않습니다.")
        }
    }

}

