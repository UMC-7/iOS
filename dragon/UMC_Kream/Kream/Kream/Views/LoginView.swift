//
//  LoginView.swift
//  Kream
//
//  Created by 권용빈 on 10/1/24.
//

import UIKit

import SnapKit

class LoginView: UIView {
    
    // MARK: - 초기화 구문
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Property
    // TODO: 수정
    
    //로고 이미지 뷰
    public lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "KreamLogo")
        return imageView
    }()
    
    
    //아이디 스택뷰
    private lazy var idStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [idLabel, idTextField, pwLabel, pwTextField, loginButton])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .fill
        
        return stackView
    }()

    //이메일 주소 라벨
    private lazy var idLabel: UILabel = titleLabel(text: "이메일 주소")
    //비밀번호 라벨
    public lazy var pwLabel: UILabel = titleLabel(text: "비밀번호")
    
    //이메일 주소 텍스트 필드
    public lazy var idTextField: UITextField = textField(placeholder: "예) kream@kream.com")
    
    //비밀번호 텍스트 필드
    public lazy var pwTextField: UITextField = textField(placeholder: "비밀번호")
    
    //로그인 버튼
    public lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("로그인", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = UIColor.lightGray
        loginButton.layer.cornerRadius = 8
        
        return loginButton
    }()
    
    // 다른로그인 스택뷰
    private lazy var otherLoginStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [kakaoLoginButton, appleLoginButton])
        stackView.axis = .vertical
        stackView.spacing = 22
        stackView.alignment = .fill
        
        return stackView
    }()
    
    private lazy var kakaoLoginButton: UIButton = otherLoginButton(logoImageUrl: "kakaologo.png", titlestring: "카카오로 로그인")
    
    private lazy var appleLoginButton: UIButton = otherLoginButton(logoImageUrl: "apple.logo", titlestring: "Apple로 로그인")
    
    //컴포넌트 추가
    // 단일 책임 원칙
    private func addComponents() {
        addSubview(logoImageView)
        addSubview(idStackView)
        addSubview(otherLoginStackView)
        constraints()
        
        func constraints() {
            //로고 이미지 뷰 레이아웃 설정
            logoImageView.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(126)
                make.centerX.equalToSuperview()
                make.width.equalTo(287)
                make.height.equalTo(75)
            }
            
            //아이디스택뷰 레이아웃 설정
            idStackView.snp.makeConstraints { make in
                make.top.equalTo(logoImageView.snp.bottom).offset(87)
                make.leading.trailing.equalToSuperview().inset(20)
                make.width.equalTo(303)
            }
            
            //이메일 주소 라벨 레이아웃 설정
            idLabel.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview().inset(20)
                make.width.equalTo(303)
                make.height.equalTo(15)
            }
            
            //이메일 주소 텍스트 필드 레이아웃 설정
            idTextField.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview().inset(20)
                make.width.equalTo(303)
                make.height.equalTo(34)
            }
            
            // 비밀번호 라벨 레이아웃 설정
            pwLabel.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview().inset(20)
                make.width.equalTo(303)
            }
            
            //비밀번호 텍스트 필드 레이아웃 설정
            pwTextField.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview().inset(20)
                make.width.equalTo(303)
                make.height.equalTo(34)
                
            }
            
            //로그인 버튼 레이아웃 설정
            loginButton.snp.makeConstraints{ make in
                make.leading.trailing.equalToSuperview().inset(20)
                make.width.equalTo(303)
                make.height.equalTo(50)
            }
            
            //다른 로그인 버튼 스택 뷰 레이아웃 설정
            otherLoginStackView.snp.makeConstraints { make in
                make.top.equalTo(idStackView.snp.bottom).offset(87)
                make.leading.trailing.equalToSuperview().inset(47.5)
                make.width.equalTo(298)
            }
            
            // 카카오 로그인 버튼 레이아웃
            kakaoLoginButton.snp.makeConstraints { make in
                make.top.equalTo(loginButton.snp.bottom).offset(87)
                make.centerX.equalToSuperview()
                make.width.equalTo(298)
                make.height.equalTo(40)
            }
            
            // Apple 로그인 버튼 레이아웃
            appleLoginButton.snp.makeConstraints { make in
                make.top.equalTo(kakaoLoginButton.snp.bottom).offset(10)
                make.centerX.equalToSuperview()
                make.width.equalTo(298)
                make.height.equalTo(40)
            }
        }
    }
    // MARK: - Function
    
    //라벨 함수
    private func titleLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        
        return label
    }
    
    
    // 텍스트필드 함수
    private func textField(placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.font = UIFont.systemFont(ofSize: 12)
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.clipsToBounds = true
        
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        
        return textField
    }
    
    // 타 로그인 방법 버튼 함수
    private func otherLoginButton(logoImageUrl: String, titlestring: String) -> UIButton {
        let logoButton = UIButton() // 전체 버튼 기능 전달
        
        /* button configuration */
        /* 단일 책임 원칙 SRP */
        var configuration = UIButton.Configuration.plain() // 버튼 꾸밈 역할
        configuration.image = UIImage(named: logoImageUrl)
        configuration.imagePlacement = .leading
        configuration.imagePadding = 69
        configuration.attributedTitle = AttributedString(titlestring, attributes: AttributeContainer([.font: UIFont.systemFont(ofSize: 13, weight: .bold), .foregroundColor: UIColor.black]))
        configuration.contentInsets = .init(top: 11, leading: 17, bottom: 13, trailing: 102)
        configuration.background.strokeColor = UIColor.lightGray
        configuration.background.cornerRadius = 10
        configuration.background.strokeWidth = 1
        logoButton.configuration = configuration
        
        return logoButton
    }
}


/*
//카카오 로그인 버튼
public lazy var kakaoLoginButton: UIButton = {
    let kakaoButton = UIButton() // 전체 버튼 기능 전달
    
    /* button configuration */
    /* 단일 책임 원칙 SRP */
    var configuration = UIButton.Configuration.plain() // 버튼 꾸밈 역할
    configuration.image = UIImage(named: "kakaologo.png")
    configuration.imagePlacement = .leading
    configuration.imagePadding = 69
    configuration.attributedTitle = AttributedString("카카오로 로그인", attributes: AttributeContainer([.font: UIFont.systemFont(ofSize: 13, weight: .bold), .foregroundColor: UIColor.black]))
    configuration.contentInsets = .init(top: 11, leading: 17, bottom: 13, trailing: 102)
    configuration.background.strokeColor = UIColor.lightGray
    configuration.background.cornerRadius = 10
    configuration.background.strokeWidth = 1
    kakaoButton.configuration = configuration
    return kakaoButton
}()
*/

/*
// Apple 로그인 버튼
    public var appleLoginButton: UIButton = {
    let appleButton = UIButton()
    appleButton.setTitle("Apple로 로그인", for: .normal)
    appleButton.setTitleColor(.black, for: .normal)
    appleButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
    appleButton.backgroundColor = .white
    appleButton.layer.borderWidth = 1
    appleButton.layer.borderColor = UIColor.lightGray.cgColor
    appleButton.layer.cornerRadius = 10
    
    let appleImage = UIImage(named: "apple.logo")
    appleButton.setImage(appleImage, for: .normal)
    appleButton.imageView?.contentMode = .scaleAspectFit
    
    appleButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -140, bottom: 0, right: 0)
    
    return appleButton
}()
*/
