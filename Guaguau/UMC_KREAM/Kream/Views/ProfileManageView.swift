//
//  ProfileManageView.swift
//  Kream
//
//  Created by 이은찬 on 11/12/24.
//

import UIKit

class ProfileManageView: UIView {
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addComponents()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    //MARK: Property
//    //뒤로가기버튼
//    private lazy var backButton: UIButton = {
//        let button = UIButton()
//        
//        button.setImage(UIImage(named: "Back"), for: .normal)
//        
//        return button
//    }()
    
    
    //프로필 관리 라벨
    private lazy var profileManageLabel = makeLabel("프로필 관리", font: UIFont.systemFont(ofSize: 16, weight: .regular))
    
    
    //유저 프로필 사진
    private lazy var profileImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "ProfileImage")
        
        return imageView
    }()
    
    
    //프로필 정보 라벨
    private lazy var profileInfoLabel = makeLabel("프로필 정보", font: .systemFont(ofSize: 18, weight: .bold))
    
    
    //이메일 라벨
    private lazy var emailLabel = makeLabel("유저 이메일", font: .systemFont(ofSize: 14, weight: .regular))
    
    
    //비밀번호 라벨
    private lazy var pwLabel: UILabel = makeLabel("유저 비밀번호", font: .systemFont(ofSize: 14, weight: .regular))
    
    
    
    //이메일 입력 텍스트필드
    public lazy var emailTextField = makeTextField(text: "새로운 이메일을 입력해주세요!")
    
    //비밀번호 입력 텍스트필드
    public lazy var pwTextField = makeTextField(text: "새로운 비밀번호를 입력해주세요!")
    
    
    //이메일 변경버튼
    public lazy var emailChangeButton = makeButton(title: "변경")
    
    //비밀번호 변경버튼
    public lazy var pwChangeButton = makeButton(title: "변경")
    
    
    //MARK: 오토레이아웃 설정
    private func addComponents(){
        //addSubview(backButton)
        addSubview(profileManageLabel)
        addSubview(profileImage)
        addSubview(profileInfoLabel)
        addSubview(emailLabel)
        addSubview(pwLabel)
        addSubview(emailTextField)
        addSubview(pwTextField)
        addSubview(emailChangeButton)
        addSubview(pwChangeButton)
    }
    
    private func constraints(){
//        backButton.snp.makeConstraints{
//            $0.top.equalToSuperview().offset(67)
//            $0.left.equalToSuperview().offset(27)
//            $0.width.equalTo(25)
//            $0.height.equalTo(25)
//        }
        
        profileManageLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(67)
            //$0.left.equalTo(backButton.snp.right).offset(112)
            $0.left.equalToSuperview().offset(164)
            $0.width.equalTo(74)
            $0.height.equalTo(26)
        }
        
        profileImage.snp.makeConstraints{
            $0.top.equalTo(profileManageLabel.snp.bottom).offset(52)
            $0.left.equalToSuperview().offset(151)
            $0.width.equalTo(90)
            $0.height.equalTo(90)
        }
        
        profileInfoLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(254)
            $0.left.equalToSuperview().offset(27)
            $0.width.equalTo(349)
            $0.height.equalTo(29)
        }
        
        emailLabel.snp.makeConstraints{
            $0.top.equalTo(profileInfoLabel.snp.bottom).offset(23)
            $0.left.equalToSuperview().offset(27)
            $0.width.equalTo(80)
            $0.height.equalTo(22)
        }
        
        pwLabel.snp.makeConstraints{
            $0.top.equalTo(emailTextField.snp.bottom).offset(23)
            $0.left.equalToSuperview().offset(27)
            $0.width.equalTo(80)
            $0.height.equalTo(22)
        }
        
        emailTextField.snp.makeConstraints{
            $0.top.equalTo(emailLabel.snp.bottom).offset(4)
            $0.left.equalToSuperview().offset(27)
            $0.width.equalTo(282)
            $0.height.equalTo(32)
        }
        
        pwTextField.snp.makeConstraints{
            $0.top.equalTo(pwLabel.snp.bottom).offset(4)
            $0.left.equalToSuperview().offset(27)
            $0.width.equalTo(282)
            $0.height.equalTo(32)
        }
        
        emailChangeButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(332)
            $0.left.equalToSuperview().offset(318)
            $0.width.equalTo(58)
            $0.height.equalTo(32)
        }
        
        pwChangeButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(413)
            $0.left.equalToSuperview().offset(318)
            $0.width.equalTo(58)
            $0.height.equalTo(32)
        }
    }
    
    
    
    
    
    //MARK: Functions
    //라벨 함수
    private func makeLabel(_ text: String, font: UIFont) -> UILabel{    // _ text : text 라벨 생략 가능
        let label = UILabel()
        
        label.text = text
        label.textColor = .black
        
        label.font = font
        
        return label
    }
    
    
    //텍스트필드 함수
    private func makeTextField(text: String) -> UITextField {
        let textField = UITextField()
        
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 1))
        
        // placeholder 텍스트 속성 설정
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.lightGray,
            .font: UIFont.systemFont(ofSize: 14) // 글씨 크기
        ]
        textField.attributedPlaceholder = NSAttributedString(string: text, attributes: placeholderAttributes)
        
        textField.layer.cornerRadius = 10  // 둥글게 만드는 속성
        textField.layer.borderWidth = 1    // 테두리 두께
        textField.layer.borderColor = UIColor.lightGray.cgColor // 테두리 색상
        textField.clipsToBounds = true  // 모서리가 잘리도록 설정
        
        return textField
    }
    
    
    //버튼 함수
    private func makeButton(title: String) -> UIButton {
        let btn = UIButton()
        btn.setTitle(title, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        btn.setTitleColor(UIColor.black, for: .normal)
        
        btn.layer.cornerRadius = 8
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.black.cgColor
        btn.clipsToBounds = true
        return btn
    }
    
    
    
    
}
