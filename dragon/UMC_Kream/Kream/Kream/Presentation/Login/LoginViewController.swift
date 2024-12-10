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
    
    // MARK: - Property
    
    /// 커스텀으로 작성한 로그인 뷰
    private lazy var loginView: LoginView = {
        let view = LoginView()
        view.loginButton.addTarget(self, action: #selector(loginFunction), for: .touchUpInside)
        return view
    }()
    
    @objc private func loginFunction() {
        guard let inputId = loginView.idTextField.text,
              let inputPwd = loginView.pwTextField.text,
              !inputId.isEmpty, !inputPwd.isEmpty else {
            print("아이디와 비밀번호를 입력해주세요")
            return
        }
        
        if let storedLoginModel = LoginModel.loadUserDefaults() {
            if storedLoginModel.id == inputId && storedLoginModel.password == inputPwd {
                print("기존 사용자 로그인 성공")
                changeRootView()
            } else {
                print("아이디 또는 비밀번호 불일치")
            }
        } else {
            let newLoginModel = LoginModel(id: inputId, password: inputPwd)
            newLoginModel.saveUserDefaults()
            print("아이디 비밀번호 새롭게 갱신 및 로그인 성공")
            changeRootView()
        }
    }
    
    /// 로그인 뷰 -> TabBarController 루트 뷰 전환 함수
    private func changeRootView() {
        let rootVC = MainTabBarController()
        
        if let window = UIApplication.shared.connectedScenes.first as? UIWindowScene, let sceneDelegate = window.delegate as? SceneDelegate, let window = sceneDelegate.window {
            window.rootViewController = rootVC
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
}
