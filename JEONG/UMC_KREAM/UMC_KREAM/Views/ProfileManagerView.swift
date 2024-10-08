//
//  ProfileManagerView.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 10/8/24.
//

import UIKit

class ProfileManagerView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addComponents()
        addStackView()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Property
    private lazy var profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile.pdf")
        return imageView
    }()
    
    private lazy var title: UILabel = makeTitleLabel("프로필 정보", font: UIFont.systemFont(ofSize: 14, weight: .bold))
    private lazy var idTitle: UILabel = makeTitleLabel("유저 이메일", font: UIFont.systemFont(ofSize: 14, weight: .regular))
    private lazy var pwdTitle: UILabel = makeTitleLabel("유저 비밀번호", font: UIFont.systemFont(ofSize: 14, weight: .regular))
    public lazy var idTextField: UITextField = makeTextField("새로운 이메일을 입력해주세요!")
    public lazy var pwdTextField: UITextField = makeTextField("새로운 비밀번호를 입력해주세요!")
    public lazy var idCheckBtn: UIButton = makeCheckBtn()
    public lazy var pwdCheckBtn: UIButton = makeCheckBtn()
    
    // MARK: - Stack
    private lazy var idCheckStack: UIStackView = makeStackView(axis: .horizontal, spacing: 9)
    private lazy var pwdCheckStack: UIStackView = makeStackView(axis: .horizontal, spacing: 9)
    private lazy var userEmailStack: UIStackView = makeStackView(axis: .vertical, spacing: 4)
    private lazy var userPwdStack: UIStackView = makeStackView(axis: .vertical, spacing: 4)
    
    private lazy var userInputStack: UIStackView = makeStackView(axis: .vertical, spacing: 23)
    
    
    // MARK: - Function
    private func makeTitleLabel(_ text: String, font: UIFont) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .black
        label.font = font
        return label
    }
    
    private func makeTextField(_ placeholder: String) -> UITextField {
        let textField = UITextField()
        
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.gray,
                .font: UIFont.systemFont(ofSize: 12)
            ]
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: placeholderAttributes)
        
        textField.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: 1))
        textField.leftViewMode = .always
        textField.textColor = UIColor.black
        textField.clipsToBounds = true
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 8
        return textField
    }
    
    private func makeStackView(axis: NSLayoutConstraint.Axis ,spacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.distribution = .equalSpacing
        stackView.alignment = .leading
        return stackView
    }
    
    private func makeCheckBtn() -> UIButton {
        let btn = UIButton()
        btn.setTitle("확인", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        btn.setTitleColor(UIColor.black, for: .normal)
        
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 8
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.borderWidth = 1
        return btn
    }
    
    private func addComponents() {
        [profileImage, title, userInputStack].forEach{ self.addSubview($0) }
    }
    
    private func addStackView() {
        [idTextField, idCheckBtn].forEach{ idCheckStack.addArrangedSubview($0) }
        [idTitle, idCheckStack].forEach{ userEmailStack.addArrangedSubview($0) }
        [pwdTextField, pwdCheckBtn].forEach{ pwdCheckStack.addArrangedSubview($0) }
        [pwdTitle, pwdCheckStack].forEach{ userPwdStack.addArrangedSubview($0) }
        [title, userEmailStack, userPwdStack].forEach{ userInputStack.addArrangedSubview($0) }
    }
    
    private func constraints() {
        profileImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(144)
            $0.left.equalToSuperview().offset(151)
            $0.width.height.equalTo(90)
        }
        
        userInputStack.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(27)
            $0.right.equalToSuperview().offset(-17)
            $0.height.equalTo(191)
        }
        
        
        idTextField.snp.makeConstraints {
            $0.width.equalTo(282)
            $0.height.equalTo(32)
        }
        
        pwdTextField.snp.makeConstraints {
            $0.width.equalTo(282)
            $0.height.equalTo(32)
        }
        
        idCheckBtn.snp.makeConstraints {
            $0.width.equalTo(58)
            $0.height.equalTo(32)
        }
        
        pwdCheckBtn.snp.makeConstraints {
            $0.width.equalTo(58)
            $0.height.equalTo(32)
        }
    }

}
