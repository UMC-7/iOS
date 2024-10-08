//
//  ViewController.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 9/23/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    let userInfo: UserInfo = UserInfo(id: "umc", pwd: "1234")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
    }
    
    private lazy var loginView: LoginView = {
        let view = LoginView()
        view.loginBtn.addTarget(self, action: #selector(loginFunction), for: .touchUpInside)
        return view
    }()
    
    @objc private func loginFunction() {
        if userInfo.id == loginView.idTextField.text, userInfo.pwd == loginView.pwdTextField.text {
            changeRootView()
        }
    }
    
    private func changeRootView() {
        let rootVC = MainTabBarController()
        
        if let window = UIApplication.shared.connectedScenes.first as? UIWindowScene, let sceneDelegate = window.delegate as? SceneDelegate, let window = sceneDelegate.window {
            window.rootViewController = rootVC
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
}

