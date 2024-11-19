//
//  ViewController.swift
//  UMC_KREAM
//
//  Created by 윤시진 on 9/30/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    let userInfo: UserInfo = UserInfo(id: "sireal", pwd: "1017")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
    }
    
    // MARK: - Property
    
    
    private lazy var loginView: LoginView = {
        let view = LoginView()
        view.loginBtn.addTarget(self, action: #selector(loginFunction), for: .touchUpInside)
        return view
    }()
    
    // MARK: - Function
    
    
    @objc private func loginFunction() {
        guard let inputId = loginView.idTextField.text,
              let inputPwd = loginView.pwdTextField.text,
              !inputId.isEmpty, !inputPwd.isEmpty else {
            print("아이디와 비밀번호를 입력해주세요")
            return
        }
        
        if let storedUserInfo = UserInfo.loadUserDefaults() {
            if storedUserInfo.id == inputId && storedUserInfo.pwd == inputPwd {
                print("기존 사용자 로그인 성공")
                changeRootView()
            } else {
                print("아이디 또는 비밀번호 불일치")
            }
        } else {
            let newUserInfo = UserInfo(id: inputId, pwd: inputPwd)
            newUserInfo.saveUserDefaults()
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
