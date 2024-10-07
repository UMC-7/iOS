//
//  ProfileEditView.swift
//  UMC_KREAM
//
//  Created by 윤시진 on 10/7/24.
//
import UIKit
import SnapKit

class ProfileEditView: UIView {
    
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    // MARK: - Properties
    
    public let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile")
        imageView.layer.cornerRadius = 40
        imageView.clipsToBounds = true
        return imageView
    }()
    
    public let backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "back"), for: .normal)
        return button
    }()
    
    public let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "프로필 관리"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    public let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "프로필 정보"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    public let userEmailLabel: UILabel = {
        let label = UILabel()
        label.text = "유저 이메일"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    public let emailTextField: UITextField = {
        let textField = UITextField()
        textField.text = "example@naver.com"
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 15
        return textField
    }()
    
    public let emailEditButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("변경", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 5
        return button
    }()
    
    public let userPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "유저 비밀번호"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    public let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.text = "***************"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
    public let passwordEditButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("변경", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 5
        return button
    }()
    
    
    
    // MARK: - Function
    
    private func setupLayout() {
        addSubview(profileImageView)
        addSubview(backButton)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(userEmailLabel)
        addSubview(emailTextField)
        addSubview(emailEditButton)
        addSubview(userPasswordLabel)
        addSubview(passwordTextField)
        addSubview(passwordEditButton)
        
        
        // SnapKit으로 레이아웃 설정
        
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(66)
            make.left.equalToSuperview().offset(27)
            make.width.height.equalTo(25)
        }
        
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(66)
            make.centerX.equalToSuperview()
        }

        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(52)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(90)
        }

        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(27)
            make.right.equalToSuperview().offset(-17)
        }

        userEmailLabel.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(23)
            make.left.equalToSuperview().offset(27)
        }

        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(userEmailLabel.snp.bottom).offset(4)
            make.left.equalToSuperview().offset(27)
        }

        emailEditButton.snp.makeConstraints { make in
            make.centerY.equalTo(emailTextField.snp.centerY)
            make.left.equalTo(emailTextField.snp.right).offset(9)
            make.right.equalToSuperview().offset(-17)
            make.width.equalTo(58)
            make.height.equalTo(32)
        }

        userPasswordLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(23)
            make.left.equalToSuperview().offset(27)
        }

        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(userPasswordLabel.snp.bottom).offset(4)
            make.left.equalToSuperview().offset(27)
        }

        passwordEditButton.snp.makeConstraints { make in
            make.centerY.equalTo(passwordTextField.snp.centerY)
            make.left.equalTo(passwordTextField.snp.right).offset(9)
            make.right.equalToSuperview().offset(-17)
            make.width.equalTo(58)
            make.height.equalTo(32)
        }
    }
}

