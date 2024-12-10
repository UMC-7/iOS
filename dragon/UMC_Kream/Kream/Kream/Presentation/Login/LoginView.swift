//
//  LoginView.swift
//  Kream
//
//  Created by 권용빈 on 10/1/24.
//

import UIKit
import SnapKit

// 로그인 뷰에 사용되는 UIView
class LoginView: UIView {
    
    // MARK: - 초기화 구문
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white
        addStackView()
        addComponents()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Property
    
    //로고 이미지 뷰
    public lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "KreamLogo")
        return imageView
    }()
    
    //아이디 라벨
    private lazy var idLabel: UILabel = titleLabel(text: "이메일 주소")
    //비밀번호 라벨
    public lazy var pwLabel: UILabel = titleLabel(text: "비밀번호")
    
    //아이디 텍스트 필드
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
    

    private lazy var kakaoLoginButton: UIButton = makeSocialBtn(image: "kakaologo.png", title: "카카오로 로그인")
    
    private lazy var appleLoginButton: UIButton = makeSocialBtn(image: "apple.logo", title: "Apple로 로그인")
    
    
    // MARK: - StackView
    
    /// 아아디 타이틀 + 아이디 텍스트 필드 저장 스택
    private lazy var idStackView: UIStackView = makeStackView(spacing: 8)
    
    /// 비밀번호 타이틀 + 비밀번호 텍스트 필드 저장 스택
    private lazy var pwdStackView: UIStackView = makeStackView(spacing: 8)
    
    /// idStackView + pwdStackView + 로그인 버튼 모음 스택
    private lazy var topUserLoginStackView: UIStackView = makeStackView(spacing: 17)
    
    /// 하단 카카오 로그인 버튼 + 애플 로그인 버튼
    private lazy var bottomSocialStackView: UIStackView = makeStackView(spacing: 22)
    
    
    // MARK: - Option
    
    /// 버튼 타이틀 텍스트 스타일 지정
    private lazy var attributeContainer: AttributeContainer = {
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        container.foregroundColor = UIColor.black
        return container
    }()
    
    /// TextField placeholder 커스텀 스타일 지정
    private lazy var placeholderContainer: [NSAttributedString.Key: Any] = {
        var value = [NSAttributedString.Key: Any]()
        value[.foregroundColor] = UIColor.gray
        value[.font] = UIFont.systemFont(ofSize: 12)
        return value
    }()
    
    //컴포넌트 추가
    // 단일 책임 원칙
    private func addStackView() {
        [idLabel, idTextField].forEach{ idStackView.addArrangedSubview($0) }
        [pwLabel, pwTextField].forEach{ pwdStackView.addArrangedSubview($0) }
        [idStackView, pwdStackView, loginButton].forEach{ topUserLoginStackView.addArrangedSubview($0) }
        [kakaoLoginButton, appleLoginButton].forEach{ bottomSocialStackView.addArrangedSubview($0) }
    }
    
    /// 컴포넌트 생성
    private func addComponents() {
        [logoImageView, topUserLoginStackView, bottomSocialStackView].forEach{ self.addSubview($0)}
    }
    
    private func constraints() {
        
        idTextField.snp.makeConstraints {
            $0.height.equalTo(34)
        }
        
        pwTextField.snp.makeConstraints {
            $0.height.equalTo(34)
        }
        
        loginButton.snp.makeConstraints {
            $0.height.equalTo(38)
        }
        
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(126)
            $0.left.equalToSuperview().offset(53)
            $0.right.equalToSuperview().offset(-53)
        }
        
        topUserLoginStackView.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(87)
            $0.left.equalToSuperview().offset(45)
            $0.right.equalToSuperview().offset(-45)
        }
        
        bottomSocialStackView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(47.5)
            $0.right.equalToSuperview().offset(-47.5)
            $0.top.equalTo(topUserLoginStackView.snp.bottom).offset(87)
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
        
        // 자동 대문자 설정 비활성화
        textField.autocapitalizationType = .none
        return textField
    }
    
    /// 중복 되는 소셜 버튼 UIButton 샐서
    /// - Parameters: 버튼 속 사용하게 되는 소셜 로고 이미지 + 버튼 타이틀
    ///   - image: 로고 이미지 이름 String 값
    ///   - title: 버튼 타이틀 String 값
    /// - Returns: 설정된 스타일의 UIButton 객체
    private func makeSocialBtn(image: String, title: String) -> UIButton {
        let btn = UIButton()
        var configuration = UIButton.Configuration.plain()
        
        configuration.image = UIImage(named: image)
        configuration.imagePlacement = .leading
        configuration.imagePadding = 69
        
        configuration.attributedTitle = AttributedString(title, attributes: attributeContainer)
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 11, leading: 17, bottom: 13, trailing: 102)
        btn.configuration = configuration
        
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 10
        btn.layer.borderColor = UIColor.gray.cgColor
        btn.layer.borderWidth = 1
        
        return btn
    }
    
    
    private func makeStackView(spacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = spacing
        stackView.distribution = .equalSpacing
        return stackView
    }
}
