//
//  ViewController.swift
//  UMC_KREAM
//
//  Created by 윤시진 on 9/30/24.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class LoginViewController: UIViewController {
    
    let userInfo: UserInfo = UserInfo(id: "sireal", pwd: "1017")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
        
        // UserDefaults 초기화 (테스트 용도)
        UserDefaults.standard.removeObject(forKey: "userId")
        UserDefaults.standard.removeObject(forKey: "userPwd")
    }
    
    // MARK: - Property
    
    
    private lazy var loginView: LoginView = {
        let view = LoginView()
        view.loginBtn.addTarget(self, action: #selector(loginFunction), for: .touchUpInside)
        view.kakaoBtn.addTarget(self, action: #selector(handleKakaoLogin), for: .touchUpInside) // 카카오 로그인 버튼 액션 추가
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
    
    // 카카오 로그인
    @objc private func handleKakaoLogin() {
        if UserApi.isKakaoTalkLoginAvailable() {
            // 카카오톡으로 로그인
            UserApi.shared.loginWithKakaoTalk { (oauthToken, error) in
                if let error = error {
                    print("카카오톡 로그인 실패: \(error.localizedDescription)")
                } else {
                    print("카카오톡 로그인 성공: \(oauthToken?.accessToken ?? "")")
                    self.navigateToMainTab() // 로그인 성공 시 메인 화면으로 전환
                }
            }
        } else {
            // 카카오톡 미설치 시, 카카오 계정 로그인으로 대체
            UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
                if let error = error {
                    print("카카오 계정 로그인 실패: \(error.localizedDescription)")
                } else {
                    print("카카오 계정 로그인 성공: \(oauthToken?.accessToken ?? "")")
                    self.navigateToMainTab() // 로그인 성공 시 메인 화면으로 전환
                }
            }
        }
    }
    
    private func navigateToMainTab() {
        let tabBarController = MainTabBarController()
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.rootViewController = tabBarController
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
    
}
