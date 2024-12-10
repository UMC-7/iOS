//
//  ProfileManagementViewController.swift
//  Kream
//
//  Created by 권용빈 on 10/8/24.
//

import UIKit

class ProfileManagementViewController: UIViewController {
    
    private lazy var profileView: ProfileManagementView = {
        let view = ProfileManagementView()
        view.emailTextField.isUserInteractionEnabled = false
        view.passwordTextField.isUserInteractionEnabled = false
        
        view.changeEmailButton.addTarget(self, action: #selector(clickBtn(_:)), for: .touchUpInside)
        view.changePasswordButton.addTarget(self, action: #selector(clickBtn(_:)), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = profileView
        setNavigation()
    }
    
    private func setNavigation() {
        self.navigationItem.title = "프로필 관리"
        let barItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor.black), style: .plain, target: self, action: #selector(popView))
        self.navigationItem.leftBarButtonItem = barItem
        
    }
    
    private func loadUserData() {
        let email = UserDefaults.standard.string(forKey: "userEmail") ?? ""
    }
    
    @objc func clickBtn(_ sender: UIButton) {
        let config = getButtonConfig(button: sender)
        guard let textField = config.textField, let userDefaultsKey = config.UserDefaultsKey else { return }
        
        if sender.titleLabel?.text == "변경" {
            sender.setTitle("확인", for: .normal)
            textField.isUserInteractionEnabled = true
            textField.becomeFirstResponder()
        } else if sender.titleLabel?.text == "확인" {
            if let text = textField.text, !text.isEmpty {
                saveUserDefaults(text, forKey: userDefaultsKey)
                sender.setTitle("변경", for: .normal)
                textField.isUserInteractionEnabled = false
                textField.resignFirstResponder()
            }
        }
    }
    
    private func getButtonConfig(button: UIButton) -> (textField: UITextField?, UserDefaultsKey: String?){
        if button == profileView.changeEmailButton {
            return (profileView.emailTextField, "userID")
        }
        else if button == profileView.changePasswordButton {
            return (profileView.passwordTextField, "userPassword")
        }
        return (nil, nil)
    }
    
    
    private func saveUserDefaults(_ value: String, forKey key: String) {
            UserDefaults.standard.set(value, forKey: key)
        }
    
    @objc func popView() {
        navigationController?.popViewController(animated: true)
    }
    
    
}
