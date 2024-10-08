//
//  ProfileManagementView.swift
//  Kream
//
//  Created by 권용빈 on 10/8/24.
//

import UIKit
import SnapKit

class ProfileManagementView: UIView {
    //MARK: - 초기화 구문
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 프로필 이미지
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profileImage")
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // 프로필 정보 라벨
    private lazy var profileInfoTextLabel: UILabel = {
        let label = UILabel()
        label.text = "프로필 정보"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    // 유저 이메일 라벨
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "유저 이메일"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    // 이메일 텍스트 필드
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "example@naver.com"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 10
        
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        return textField
    }()
    
    // 이메일 변경 버튼
    private lazy var changeEmailButton: UIButton = {
        let button = UIButton()
        button.setTitle("변경", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 6
        return button
    }()
    
    // 이메일 번경 스택뷰
    private lazy var emailChangeStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, changeEmailButton])
        stackView.axis = .horizontal
        stackView.spacing = 9
        return stackView
    }()
    
    // 이메일 스택뷰
    private lazy var emailStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailLabel, emailChangeStackView])
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    
    // 유저 비밀번호 라벨
    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "유저 비밀번호"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    // 비밀번호 텍스트 필드
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "***************"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 10
        textField.isSecureTextEntry = true
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        return textField
    }()
    
    // 비밀번호 변경 버튼
    private lazy var changePasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("변경", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 6
        return button
    }()
    
    // 비밀번호 변경 스택뷰
    private lazy var passwordChangeStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [passwordTextField, changePasswordButton])
        stackView.axis = .horizontal
        stackView.spacing = 9
        return stackView
    }()
    
    // 비밀번호 스택뷰
    private lazy var passwordStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [passwordLabel, passwordChangeStackView])
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    // 프로필 전체 스택 뷰
    private lazy var profileStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [profileInfoTextLabel, emailStackView, passwordStackView])
        stackView.axis = .vertical
        stackView.spacing = 23
        stackView.alignment = .leading
        return stackView
    }()
    
    
    private func addComponents(){
        addSubview(profileImageView)
        addSubview(profileStackView)
        constraints()
        
        func constraints() {
            //프로필 이미지 뷰
            profileImageView.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(144)
                make.leading.equalToSuperview().offset(151)
                make.trailing.equalToSuperview().offset(-152)
                make.width.height.equalTo(90)
            }
            
            //프로필 스택 뷰
            profileStackView.snp.makeConstraints { make in
                make.top.equalTo(profileImageView.snp.bottom).offset(20)
                make.leading.equalToSuperview().offset(27)
                make.width.equalTo(349)
            }
            
            //이메일 스택 뷰
            emailStackView.snp.makeConstraints { make in
                make.top.equalTo(profileInfoTextLabel.snp.bottom).offset(23)
            }
            
            // 이메일 변경 스택 뷰
            emailChangeStackView.snp.makeConstraints { make in
                make.width.equalTo(349)
                make.height.equalTo(32)
            }
            //이메일 텍스트 필드
            emailTextField.snp.makeConstraints{ make in
                make.width.equalTo(282)
            }
            
            //이메일 변경 버튼
            changeEmailButton.snp.makeConstraints{ make in
                make.width.equalTo(58)
            }
            
            // 비밀번호 변경 스택 뷰
            passwordChangeStackView.snp.makeConstraints { make in
                make.width.equalTo(349)
                make.height.equalTo(32)
            }
            // 비밀번호 텍스트 필드
            passwordTextField.snp.makeConstraints{ make in
                make.width.equalTo(282)
            }
            
            // 비밀번호 변경 버튼
            changePasswordButton.snp.makeConstraints{ make in
                make.width.equalTo(58)
            }
            
        }
    }
}
