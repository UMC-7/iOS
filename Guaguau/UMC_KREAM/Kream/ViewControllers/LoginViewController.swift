//
//  ViewController.swift
//  1st_Week
//
//  Created by 이은찬 on 9/30/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    //이메일, 비번을 지정해 놓음
    let userInfo: UserInfo = UserInfo(id: "A", pw: "1")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
    }
    
    private lazy var loginView: LoginView = {
        let view = LoginView()
        
        view.loginButton.addTarget(self, action: #selector(loginFunction), for: .touchUpInside)
        
        return view
    }()
    
    //데이터 모델에 지정한 아이디, 비밀번호에 해당 할 경우 로그인 가능하도록 하는 함수
    @objc private func loginFunction() {
        
        guard let inputId = loginView.emailTextField.text,
              let inputPw = loginView.passwordTextField.text,
              !inputId.isEmpty, !inputPw.isEmpty else {
            print("아이디와 비밀번호를 입력해주세요")
            return
        }
        
        if let storedUserInfo = UserInfo.loadUserDefaults() {
            if storedUserInfo.id == inputId && storedUserInfo.pw == inputPw {
                print("기존 사용자 로그인 성공")
                changeRootView()
            } else {
                print("아이디 또는 비밀번호 불일치")
            }
        } else {
            let newUserInfo = UserInfo(id: inputId, pw: inputPw)
            newUserInfo.saveUserDefaults()
            print("아이디 비밀번호 새롭게 갱신 및 로그인 성공")
            changeRootView()
        }
    }
    
        //로그인 뷰 -> TabBarController 루트 뷰 전환 함수
        private func changeRootView() {
            let rootVC = BaseViewController()
            
            if let window = UIApplication.shared.connectedScenes.first as? UIWindowScene, let sceneDelegate = window.delegate as? SceneDelegate, let window = sceneDelegate.window {
                window.rootViewController = rootVC
                UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
}
