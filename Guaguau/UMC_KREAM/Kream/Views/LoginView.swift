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
        addComponents()
        constraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Property
    
    private lazy var kreamImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "KreamLogo.png")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var emailLabel: UILabel = textFiledTitle(text: "이메일 주소를 입력해주세요")
    private lazy var passwordLabel: UILabel = textFiledTitle(text: "비밀번호를 입력해주세요")
    
    public lazy var emailTextField: UITextField = textField(text: "예)Kream@kream.co.kr")
    public lazy var passwordTextField: UITextField = textField(text: "비밀번호를 입력하세요")
    
    public lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 8
        return button
    }()
    
    
    public lazy var kakaoLoginButton: UIButton = {
        /* 단일 책임 원칙 SRP */
        let button = UIButton(type: .system)  //단순히 버튼결과 담당
        var configuration = UIButton.Configuration.plain() //버튼 꾸밈 담당
        
        configuration.image = UIImage(systemName: "applelogo")?.withRenderingMode(.alwaysOriginal).withTintColor(.black)
        configuration.attributedTitle = AttributedString("카카오로 로그인", attributes: AttributeContainer([.font: UIFont.systemFont(ofSize: 13, weight: .bold), .foregroundColor: UIColor.black]))
        configuration.imagePlacement = .leading     // NSDirectionalRectEdge.leading (직접참조)
        configuration.imagePadding = 69
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 11, leading: 17, bottom: 13, trailing: 102)
        
        button.configuration = configuration
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1  // 테두리 두께 설정
        button.layer.borderColor = UIColor.gray.cgColor  // 테두리 색상 설정
        
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
    
    private lazy var socialLoginStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 22
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        return stackView
    }()
    
    
    /// 오토레이아웃 설정입니다,
    /* 단일 책임 원칙 SRP */
    private func addComponents() {
        self.addSubview(kreamImageView)
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordLabel)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
        
        self.addSubview(socialLoginStackView)
        socialLoginStackView.addArrangedSubview(kakaoLoginButton)
        socialLoginStackView.addArrangedSubview(kakaoLoginButton)
    }
    
    private func constraints() {
        kreamImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(126)
//            $0.bottom.equalToSuperview().offset(-651) 필요 X
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
            $0.centerX.equalToSuperview()
            $0.width.equalTo(303)
            $0.height.equalTo(34)
        }
        
        passwordLabel.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(17)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(303)
            $0.height.equalTo(15)
        }
        
        passwordTextField.snp.makeConstraints {
            
            $0.top.equalTo(passwordLabel.snp.bottom).offset(8)
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
        
        socialLoginStackView.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(87)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(298)
        }
    }
    
    
    // MARK: - Function
    
    private func textFiledTitle(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.black
        return label
    }
    
    private func textField(text: String) -> UITextField {
        let textField = UITextField()
        
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 1))
        
        textField.placeholder = text
        
        textField.layer.cornerRadius = 15  // 둥글게 만드는 속성
        textField.layer.borderWidth = 1    // 테두리 두께
        textField.layer.borderColor = UIColor.lightGray.cgColor // 테두리 색상
        textField.clipsToBounds = true  // 모서리가 잘리도록 설정
        return textField
    }
}

