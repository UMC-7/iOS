//
//  ProfileEditViewController.swift
//  UMC_KREAM
//
//  Created by 윤시진 on 10/7/24.
//

import UIKit

class ProfileEditViewController: UIViewController {
    
    
        var isEditingEmail = false
        var isEditingPassword = false
    

        private lazy var profileEditView: ProfileEditView = {
            let view = ProfileEditView()
            return view
        }()
        
    
    // MARK: - Function
    
        override func viewDidLoad() {
            super.viewDidLoad()
            self.view = profileEditView
            
            setupActions()
            navigationItem.hidesBackButton = true
        }
        
        private func setupActions() {
            profileEditView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
            profileEditView.emailEditButton.addTarget(self, action: #selector(emailEditButtonTapped), for: .touchUpInside)
            profileEditView.passwordEditButton.addTarget(self, action: #selector(passwordEditButtonTapped), for: .touchUpInside)
        }

        // 뒤로 가기 버튼 이벤트
        @objc private func backButtonTapped() {
            navigationController?.popViewController(animated: true)
        }
        
        // 이메일 편집 버튼 이벤트
        @objc private func emailEditButtonTapped() {
            if isEditingEmail {
                profileEditView.emailTextField.isEnabled = false
                profileEditView.emailEditButton.setTitle("변경", for: .normal)
                isEditingEmail = false
            } else {
                profileEditView.emailTextField.isEnabled = true
                profileEditView.emailEditButton.setTitle("확인", for: .normal)
                profileEditView.emailTextField.text = ""
                profileEditView.emailTextField.placeholder = "새로운 이메일을 입력해주세요!"
                isEditingEmail = true
            }
        }

        // 비밀번호 편집 버튼 이벤트
        @objc private func passwordEditButtonTapped() {
            if isEditingPassword {
                profileEditView.passwordTextField.isEnabled = false
                profileEditView.passwordEditButton.setTitle("변경", for: .normal)
                isEditingPassword = false
            } else {
                profileEditView.passwordTextField.isEnabled = true
                profileEditView.passwordEditButton.setTitle("확인", for: .normal)
                profileEditView.passwordTextField.text = ""
                profileEditView.passwordTextField.placeholder = "새로운 비밀번호를 입력해주세요!"
                isEditingPassword = true
            }
        }
}
