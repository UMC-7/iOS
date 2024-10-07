//
//  MyPageView.swift
//  UMC_KREAM
//
//  Created by 윤시진 on 10/7/24.
//

import UIKit

class MyPageView: UIView {

    // MARK: - Properties
    
    public let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile")
        imageView.layer.cornerRadius = 40
        imageView.clipsToBounds = true
        return imageView
    }()
    
    public let settingsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "system"), for: .normal)
        return button
    }()
    
    public let cameraButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "camera"), for: .normal)
        return button
    }()
    
    public let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Jeong_iOS"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.black
        return label
    }()
    
    public let followerLabel: UILabel = {
        let label = UILabel()
        label.text = "팔로워 326   팔로잉 20"
        label.font = UIFont.systemFont(ofSize: 8)
        label.textColor = UIColor.black
        return label
    }()
    
    public let manageProfileButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "profilebutton-1"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    public let shareProfileButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "profilebutton-2"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup Layout
    private func setupLayout() {
        addSubview(profileImageView)
        addSubview(settingsButton)
        addSubview(cameraButton)
        addSubview(nameLabel)
        addSubview(followerLabel)
        addSubview(manageProfileButton)
        addSubview(shareProfileButton)

        // 설정 버튼 레이아웃
        settingsButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(75)
            make.left.equalToSuperview().offset(32.5)
            make.width.height.equalTo(25)
        }

        // 카메라 버튼 레이아웃
        cameraButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(75)
            make.right.equalToSuperview().offset(-33.5)
            make.width.height.equalTo(25)
        }

        // 프로필 이미지 레이아웃
        profileImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(147)
            make.left.equalToSuperview().offset(32.5)
            make.width.height.equalTo(90)
        }

        // 이름 라벨 레이아웃
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.top).offset(21)
            make.left.equalTo(profileImageView.snp.right).offset(16)
            make.width.equalTo(115)
            make.height.equalTo(23)
        }

        // 팔로워 및 팔로잉 라벨 레이아웃
        followerLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.left.equalTo(profileImageView.snp.right).offset(16)
            make.width.equalTo(115)
            make.height.equalTo(19)
        }

        // 프로필 관리 버튼 레이아웃 (PDF 이미지)
        manageProfileButton.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(26)
            make.left.equalToSuperview().offset(32.5)
            make.width.equalTo(157)
            make.height.equalTo(26)
        }

        // 프로필 공유 버튼 레이아웃 (PDF 이미지)
        shareProfileButton.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(26)
            make.left.equalTo(manageProfileButton.snp.right).offset(14)
            make.width.equalTo(157)
            make.height.equalTo(26)
        }
    }

}
