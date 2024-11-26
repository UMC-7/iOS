//
//  MyPageManageViewController.swift
//  UMC_KREAM
//
//  Created by 윤시진 on 11/7/24.
//

import UIKit

/// 프로필 관리 페이지 뷰 컨트롤러
class MyPageManageViewController: UIViewController {
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = profileManagerView
        setNavigation()
    }
    
    // MARK: - Property
    
    private func setNavigation() {
        self.navigationItem.title = "프로필 관리"
        
        let backBtn = UIBarButtonItem(image: UIImage(systemName: "arrow.left")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor.black), style: .plain, target: self, action: #selector(didTap))
        navigationItem.leftBarButtonItem = backBtn
    }
    
    /// 프로필 관리 페이지 커스텀 뷰
    private lazy var profileManagerView: ProfileManagerView = {
        let view = ProfileManagerView()
        view.idCheckBtn.addTarget(self, action: #selector(clickedBtn(_:)), for: .touchUpInside)
        view.pwdCheckBtn.addTarget(self, action: #selector(clickedBtn(_:)), for: .touchUpInside)
        return view
    }()
    
    // MARK: - Function
    
    @objc func didTap() {
        navigationController?.popViewController(animated: true)
    }
    

    @objc func clickedBtn(_ sender: UIButton) {
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
    

    private func getButtonConfig(button: UIButton) -> (textField: UITextField?, UserDefaultsKey: String?) {
        if button == profileManagerView.idCheckBtn {
            return (profileManagerView.idTextField, "userId")
        } else if button == profileManagerView.pwdCheckBtn {
            return (profileManagerView.pwdTextField, "userPwd")
        }
        return (nil, nil)
    }

    private func saveUserDefaults(_ value: String, forKey key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
}
