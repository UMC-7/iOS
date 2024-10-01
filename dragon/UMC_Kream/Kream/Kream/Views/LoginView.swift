//
//  LoginView.swift
//  Kream
//
//  Created by 권용빈 on 10/1/24.
//

import UIKit

import SnapKit

class LoginView: UIView {
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //로고 이미지 뷰
    public lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "KreamLogo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    //이메일 주소 라벨
    public lazy var IDLabel: UILabel = {
        let idLabel = UILabel()
        idLabel.text = "이메일 주소"
        idLabel.font = UIFont.systemFont(ofSize: 12)
        idLabel.textColor = .black
        
        return idLabel
    }()
    
    //이메일 주소 텍스트 필드
    public lazy var IDTextField: UITextField = {
        let idTextField = UITextField()
        idTextField.placeholder = "예) kream@kream.co.kr"
        idTextField.font = UIFont.systemFont(ofSize: 12)
        idTextField.layer.cornerRadius = 15
        idTextField.layer.borderWidth = 1
        idTextField.layer.borderColor = UIColor.lightGray.cgColor
        idTextField.clipsToBounds = true
        
        return idTextField
    }()
    
    //비밀번호 라벨
    public lazy var PWLabel: UILabel = {
        let pwLabel = UILabel()
        pwLabel.text = "비밀번호"
        pwLabel.font = UIFont.systemFont(ofSize: 12)
        pwLabel.textColor = .black
        
        return pwLabel
    }()
    
    //비밀번호 텍스트 필드
    public lazy var PWTextField: UITextField = {
        let pwTextField = UITextField()
        pwTextField.placeholder = "비밀번호를 입력해주세요"
        pwTextField.font = UIFont.systemFont(ofSize: 12)
        pwTextField.layer.cornerRadius = 15
        pwTextField.layer.borderWidth = 1
        pwTextField.layer.borderColor = UIColor.lightGray.cgColor
        pwTextField.clipsToBounds = true
        
        pwTextField.isSecureTextEntry = true // 비밀번호 입력 시 숨김
        
        return pwTextField
    }()
    
    //로그인 버튼
    public lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("로그인", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = .lightGray
        loginButton.layer.cornerRadius = 8
        
        return loginButton
    }()
    
    //카카오 로그인 버튼
    public lazy var kakaoLoginButton: UIButton = {
        let kakaoButton = UIButton()
        kakaoButton.setTitle("카카오로 로그인", for: .normal)
        kakaoButton.setTitleColor(.black, for: .normal)
        kakaoButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        kakaoButton.backgroundColor = .white
        kakaoButton.layer.borderWidth = 1
        kakaoButton.layer.borderColor = UIColor.lightGray.cgColor
        kakaoButton.layer.cornerRadius = 10
        
        let kakaoImage = UIImage(named: "kakao_logo")
        kakaoButton.setImage(kakaoImage, for: .normal)
        kakaoButton.imageView?.contentMode = .scaleAspectFit
        
        kakaoButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -140, bottom: 0, right: 0)
        
        kakaoButton.imageView?.snp.makeConstraints { make in
            make.width.equalTo(15)
            make.height.equalTo(14)
        }
        
        return kakaoButton
        }()
    
    // Apple 로그인 버튼
    public lazy var appleLoginButton: UIButton = {
        let appleButton = UIButton()
        appleButton.setTitle("Apple로 로그인", for: .normal)
        appleButton.setTitleColor(.black, for: .normal)
        appleButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
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
    
    
    
    //컴포넌트 추가
    private func addComponents() {
        addSubview(logoImageView)
        addSubview(IDLabel)
        addSubview(IDTextField)
        addSubview(PWLabel)
        addSubview(PWTextField)
        addSubview(loginButton)
        addSubview(kakaoLoginButton)
        addSubview(appleLoginButton)
        
        //로고 이미지 뷰 레이아웃 설정
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(126)
            make.centerX.equalToSuperview()
            make.width.equalTo(287)
            make.height.equalTo(75)
        }
        
        //이메일 주소 라벨 및 텍스트 필드 레이아웃 설정
        IDLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(87)
            make.leading.trailing.equalToSuperview().inset(20)
            make.width.equalTo(303)
            make.height.equalTo(15)
        }
        
        IDTextField.snp.makeConstraints { make in
            make.top.equalTo(IDLabel.snp.bottom).offset(17)
            make.leading.trailing.equalToSuperview().inset(20)
            make.width.equalTo(303)
            make.height.equalTo(34)
        }
        
        // 비밀번호 라벨 및 텍스트 필드 레이아웃 설정
        PWLabel.snp.makeConstraints { make in
            make.top.equalTo(IDTextField.snp.bottom).offset(17)
            make.leading.trailing.equalToSuperview().inset(20)
            make.width.equalTo(303)
        }
        
        PWTextField.snp.makeConstraints { make in
            make.top.equalTo(PWLabel.snp.bottom).offset(17)
            make.leading.trailing.equalToSuperview().inset(20)
            make.width.equalTo(303)
            make.height.equalTo(34)

        }
        
        //로그인 버튼 레이아웃 설정
        loginButton.snp.makeConstraints{ make in
            make.top.equalTo(PWTextField.snp.bottom).offset(17)
            make.leading.trailing.equalToSuperview().inset(20)
            make.width.equalTo(303)
            make.height.equalTo(50)
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
