//
//  MyPageTopView.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 10/8/24.


import UIKit
import SnapKit

class MyPageTopView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addStackView()
        addComponents()
        Constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Property
    
    /* 상단 버튼 */
    private lazy var optionIcon: UIButton = makeIconBtn(image: "option.pdf")
    private lazy var cameraIcon: UIButton = makeIconBtn(image: "camera.pdf")
    
    /* 유저 정보 */
    private lazy var userProfile: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile.pdf")
        return imageView
    }()
    
    private lazy var userName: UILabel = makeUserInfo(content: "Jeong_iOS", font: UIFont.systemFont(ofSize: 16, weight: .medium))
    private lazy var userFollow: UILabel = makeUserSub(content: "팔로워", count: 326)
    private lazy var userFollowing: UILabel = makeUserSub(content: "팔로잉", count: 20)
    
    /* 프로필 관련 버튼 */
    public lazy var profileManageBtn: UIButton = makeUserBtn(title: "프로필 관리")
    public lazy var profileShareBtn: UIButton = makeUserBtn(title: "프로필 공유")
    
    // MARK: - StackView
    private lazy var topOptionStack: UIStackView = makeStackView(axis: .horizontal, spacing: 277)
    
    private lazy var userFollowerStack: UIStackView = makeStackView(axis: .horizontal, spacing: 8)
    private lazy var userInfoTextStack: UIStackView = makeStackView(axis: .vertical, spacing: 6)
    
    private lazy var profileBtnStack: UIStackView = makeStackView(axis: .horizontal, spacing: 14)
    
    
    // MARK: - Function
    private func makeIconBtn(image: String) -> UIButton {
        let btn = UIButton()
        btn.setImage(UIImage(named: image), for: .normal)
        return btn
    }
    
    private func makeUserInfo(content: String, font: UIFont) -> UILabel {
        let label = UILabel()
        label.text = content
        label.font = font
        label.textColor = .black
        return label
    }
    
    private func makeUserSub(content: String, count: Int) -> UILabel {
        let label = UILabel()
        
        let textValue = content + " " + String(count)
        let attributedString = NSMutableAttributedString(string: textValue)
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 12, weight: .regular), range: NSRange(location: 0, length: content.count))
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 12, weight: .bold), range: NSRange(location: content.count, length: String(count).count + 1))
        
        label.attributedText = attributedString
        label.textColor = UIColor.black
        return label
    }
    
    private func makeUserBtn(title: String) -> UIButton {
        let btn = UIButton()
        btn.setTitle(title, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 9, weight: .bold)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 8
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.gray.cgColor
        return btn
    }
    
    private func makeStackView(axis: NSLayoutConstraint.Axis, spacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.distribution = .equalSpacing
        return stackView
    }
    
    private func addComponents() {
        
        [topOptionStack, userProfile, userInfoTextStack, profileBtnStack].forEach { self.addSubview($0) }
    }
    
    private func addStackView() {
        [optionIcon, cameraIcon].forEach{ topOptionStack.addArrangedSubview($0) }
        
        [userFollow, userFollowing].forEach{ userFollowerStack.addArrangedSubview($0) }
        [userName, userFollowerStack].forEach{ userInfoTextStack.addArrangedSubview($0) }
        
        [profileManageBtn, profileShareBtn].forEach{ profileBtnStack.addArrangedSubview($0) }
    }
    
    private func Constraints() {
        
        topOptionStack.snp.makeConstraints {
            $0.top.equalToSuperview().offset(75)
            $0.left.equalToSuperview().offset(32.5)
            $0.right.equalToSuperview().offset(-32.5)
            $0.height.equalTo(25)
        }
        
        userProfile.snp.makeConstraints {
            $0.top.equalTo(topOptionStack.snp.bottom).offset(26)
            $0.left.equalToSuperview().offset(32.5)
            $0.width.height.equalTo(90)
        }
        
        userInfoTextStack.snp.makeConstraints {
            $0.left.equalTo(userProfile.snp.right).offset(16)
            $0.top.equalTo(topOptionStack.snp.bottom).offset(47)
            $0.width.greaterThanOrEqualTo(115)
            $0.height.equalTo(48)
        }
        
        profileBtnStack.snp.makeConstraints {
            $0.left.equalToSuperview().offset(32.5)
            $0.right.equalToSuperview().offset(-32.5)
            $0.bottom.equalToSuperview().offset(-29)
            $0.height.equalTo(26)
        }
        
        profileManageBtn.snp.makeConstraints {
            $0.width.equalTo(157)
            $0.height.equalTo(26)
        }
        
        profileShareBtn.snp.makeConstraints {
            $0.width.equalTo(157)
            $0.height.equalTo(26)
        }
    }
}
