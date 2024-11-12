//
//  LoginView.swift
//  1st_Week
//
//  Created by 이은찬 on 9/30/24.
//


import UIKit

import SnapKit

class LoginView: UIView {
    
   
    //MARK: - 초기화 구문
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addComponents()
        constraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Property
    //크림로고
    private lazy var kreamImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "KreamLogo")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    //로그인 정보 입력 라벨
    private lazy var emailLabel: UILabel = textFiledTitle(text: "이메일 주소")
    private lazy var passwordLabel: UILabel = textFiledTitle(text: "비밀번호")
    
    
    //로그인 정보 입력 텍스트필드
    public lazy var emailTextField: UITextField = textField(text: "예)Kream@kream.co.kr")
    public lazy var passwordTextField: UITextField = textField(text: "비밀번호를 입력해주세요")
    
    
    //로그인 버튼
    public lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 8
        return button
    }()
    
    
    //카카오, 애플 로그인 버튼
    public lazy var kakaoLoginButton: UIButton = loginButton(imageName: "KakaoLogo", label: "Kakao로 로그인")
    public lazy var appleLoginButton: UIButton = loginButton(imageName: "AppleLogo", label: "Apple로 로그인")

    
    //카카오, 애플 로그인 버튼 스택
    private lazy var socialLoginStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 22
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        return stackView
    }()
    
    
    //MARK: 오토레이아웃 설정
    private func addComponents() {
        self.addSubview(kreamImageView)
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordLabel)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
        
        self.addSubview(socialLoginStackView)
        socialLoginStackView.addArrangedSubview(kakaoLoginButton)
        socialLoginStackView.addArrangedSubview(appleLoginButton)
    }
    
    private func constraints() {
        kreamImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(126)
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
    
    //텍스트 필드 위의 제목 함수
    private func textFiledTitle(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.black
        return label
    }
    
    // 텍스트 필드 함수(정보 입력)
    private func textField(text: String) -> UITextField {
        let textField = UITextField()
        
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 1))
        
        // placeholder 텍스트 속성 설정
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.lightGray,
            .font: UIFont.systemFont(ofSize: 12) // 글씨 크기
        ]
        textField.attributedPlaceholder = NSAttributedString(string: text, attributes: placeholderAttributes)
        
        textField.layer.cornerRadius = 15  // 둥글게 만드는 속성
        textField.layer.borderWidth = 1    // 테두리 두께
        textField.layer.borderColor = UIColor.lightGray.cgColor // 테두리 색상
        textField.clipsToBounds = true  // 모서리가 잘리도록 설정
        
        return textField
    }
    
    //소셜로그인 버튼 함수
    private func loginButton(imageName: String, label: String) -> UIButton{
        
        /* 단일 책임 원칙 SRP */
        let button = UIButton(type: .system)  //단순히 버튼결과 담당
        var configuration = UIButton.Configuration.plain() //버튼 꾸밈 담당
        
        configuration.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        
        configuration.attributedTitle = AttributedString(label, attributes: AttributeContainer([.font: UIFont.systemFont(ofSize: 13, weight: .medium), .foregroundColor: UIColor.black]))
        configuration.imagePlacement = .leading
        configuration.imagePadding = 69
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 11, leading: 17, bottom: 13, trailing: 102)
        
        button.configuration = configuration
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1  // 테두리 두께 설정
        button.layer.borderColor = UIColor.gray.cgColor  // 테두리 색상 설정
        
        return button
    }
}

