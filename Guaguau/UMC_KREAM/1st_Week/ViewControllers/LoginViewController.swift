//
//  ViewController.swift
//  1st_Week
//
//  Created by 이은찬 on 9/30/24.
//

import UIKit

class LoginViewController: UIViewController {

    // LoginView 인스턴스를 생성
    let loginView = LoginView()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // TODO: 여기 고쳐주세용
        
        
        // view에 loginView 추가
        view.addSubview(loginView)

        // 오토레이아웃 설정
        loginView.snp.makeConstraints { make in
            make.edges.equalToSuperview() // 화면의 전체를 채우도록 설정
        }

        // LoginView의 UI 구성 요소 추가
        loginView.addComponents()
        
        // 버튼 액션 추가 (예: 로그인 버튼)
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginView.kakaoLoginButton.addTarget(self, action: #selector(kakaoLoginButtonTapped), for: .touchUpInside)
        loginView.appleLoginButton.addTarget(self, action: #selector(appleLoginButtonTapped), for: .touchUpInside)
    }

    @objc func loginButtonTapped() {
        print("로그인 버튼 눌림")
        // 이메일과 비밀번호를 확인하여 로그인 처리 로직 작성
        let email = loginView.emailTextField.text ?? ""
        let password = loginView.passwordTextField.text ?? ""
        print("Email: \(email), Password: \(password)")
    }

    @objc func kakaoLoginButtonTapped() {
        print("카카오 로그인 버튼 눌림")
        // 카카오 로그인 처리 로직 작성
    }

    @objc func appleLoginButtonTapped() {
        print("Apple 로그인 버튼 눌림")
        // 애플 로그인 처리 로직 작성
    }
}
