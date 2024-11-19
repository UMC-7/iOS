//
//  ProfileManageViewController.swift
//  Kream
//
//  Created by 이은찬 on 11/12/24.
//

import UIKit

class ProfileManageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = profileManageView

    }
    
    //프로필 관리 페이지뷰
    private lazy var profileManageView: ProfileManageView = {
        let view = ProfileManageView()
        
        view.emailChangeButton.addTarget(self, action: #selector(clickedBtn(_:)), for: .touchUpInside)
        view.pwChangeButton.addTarget(self, action: #selector(clickedBtn(_:)), for: .touchUpInside)
        
        return view
    }()
    
    //프로필 관리 네비게이션 버튼
    private func setNavigation() {
        self.navigationItem.title = "프로필 관리"
        
        let backBtn = UIBarButtonItem(image: UIImage(systemName: "arrow.left")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor.black), style: .plain, target: self, action: #selector(didTap))
        navigationItem.leftBarButtonItem = backBtn
    }
    
    //이전 화면으로
    @objc func didTap() {
        navigationController?.popViewController(animated: true)
    }
    
    
    //이메일 & 비밀번호 변경 버튼
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
    
    //변경 버튼이 아이디에 해당하는지 비밀번호에 해당하는지 판단
    private func getButtonConfig(button: UIButton) -> (textField: UITextField?, UserDefaultsKey: String?) {
        if button == profileManageView.emailChangeButton {
            return (profileManageView.emailTextField, "userId")
        } else if button == profileManageView.pwChangeButton {
            return (profileManageView.pwTextField, "userPwd")
        }
        return (nil, nil)
    }
    
    
    //변경된 값 UserDefaults에 저장
     private func saveUserDefaults(_ value: String, forKey key: String) {
         UserDefaults.standard.set(value, forKey: key)
     }
}
