//
//  LoginView.swift
//  1st_Week
//
//  Created by 이은찬 on 9/30/24.
//


import UIKit

import SnapKit

class LoginView: UIView {
    
    // MARK: - 초기화 구문

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Property

    
    let KreamImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "KreamLogo.png")
        imageView.contentMode = .scaleAspectFit
        return imageView
        
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일 주소"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 1))
        
        textField.placeholder = "예)Kream@kream.co.kr"
        textField.borderStyle = .none  // borderStyle을 none으로 설정해야 커스텀 스타일을 적용할 수 있습니다
        textField.layer.cornerRadius = 15  // 둥글게 만드는 속성
        textField.layer.borderWidth = 1    // 테두리 두께
        textField.layer.borderColor = UIColor.lightGray.cgColor // 테두리 색상
        textField.clipsToBounds = true  // 모서리가 잘리도록 설정
        return textField
    }()
    

    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 1))
        
        textField.placeholder = "비밀번호를 입력해주세요"
        textField.borderStyle = .none  // borderStyle을 none으로 설정해야 커스텀 스타일을 적용할 수 있습니다
        textField.layer.cornerRadius = 15  // 둥글게 만드는 속성
        textField.layer.borderWidth = 1    // 테두리 두께
        textField.layer.borderColor = UIColor.lightGray.cgColor // 테두리 색상
        textField.clipsToBounds = true  // 모서리가 잘리도록 설정
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 5
        button.tintColor = .white
        return button
    }()
    
    
    let kakaoLoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("카카오로 로그인", for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.tintColor = .black
        
        button.layer.borderWidth = 1  // 테두리 두께 설정
        button.layer.borderColor = UIColor.black.cgColor  // 테두리 색상 설정
        
        return button
    }()
    
    let appleLoginButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setImage(UIImage(systemName: "applelogo"), for: .normal)  // 애플 로고 추가
        
        button.setTitle("Apple로 로그인", for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.tintColor = .black
        
        button.layer.borderWidth = 1  // 테두리 두께 설정
        button.layer.borderColor = UIColor.black.cgColor  // 테두리 색상 설정
        
        
        return button
    }()
    
    
    /// 오토레이아웃 설정입니다,
    public func addComponents() {
        self.addSubview(KreamImageView)
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordLabel)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
        self.addSubview(kakaoLoginButton)
        self.addSubview(appleLoginButton)
        
        KreamImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(126)
            $0.bottom.equalToSuperview().offset(-651)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(287)
            $0.height.equalTo(75)
        }
        
        emailLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(288)
            //$0.bottom.equalToSuperview().offset(-549)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(303)
            $0.height.equalTo(15)
        }
        
        emailTextField.snp.makeConstraints {
            
            $0.top.equalTo(emailLabel.snp.bottom).offset(8)
            
            $0.top.equalToSuperview().offset(311)
            //$0.bottom.equalToSuperview().offset(-507)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(303)
            $0.height.equalTo(34)
        }
        
        passwordLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(362)
            //$0.bottom.equalToSuperview().offset(-475)    //왜 이거 지우니까 됨??
            $0.centerX.equalToSuperview()
            $0.width.equalTo(303)
            $0.height.equalTo(15)
        }
        
        passwordTextField.snp.makeConstraints {
            
            $0.top.equalTo(passwordLabel.snp.bottom).offset(8)
            
            $0.top.equalToSuperview().offset(385)
            //$0.bottom.equalToSuperview().offset(-433)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(303)
            $0.height.equalTo(34)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(17)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(303)
            $0.height.equalTo(38)
        }
        
        kakaoLoginButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(561)
            //$0.bottom.equalToSuperview().offset(-251)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(298)
            $0.height.equalTo(40)
        }
        
        appleLoginButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(623)
            //$0.bottom.equalToSuperview().offset(-189)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(298)
            $0.height.equalTo(40)
        }
    }
    
    
}

