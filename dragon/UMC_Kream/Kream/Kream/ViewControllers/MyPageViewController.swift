//
//  MyPageViewController.swift
//  Kream
//
//  Created by 권용빈 on 10/6/24.
//

import UIKit
class MyPageViewController: UIViewController {
    
    // 프로필 이미지, 팔로워 정보, 버튼 등을 선언
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profileImage")
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var followerLabel: UILabel = {
        let label = UILabel()
        label.text = "팔로워 326명"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var followingLabel: UILabel = {
        let label = UILabel()
        label.text = "팔로잉 20명"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var profileManagingButton: UIButton = {
        let button = UIButton()
        button.setTitle("프로필 관리", for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 8
        return button
    }()
    
    private lazy var profileSharingButton: UIButton = {
        let button = UIButton()
        button.setTitle("프로필 공유", for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 8
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        // UI 컴포넌트들을 뷰에 추가
        view.addSubview(profileImageView)
        view.addSubview(followerLabel)
        view.addSubview(followingLabel)
        view.addSubview(profileManagingButton)
        view.addSubview(profileSharingButton)
        
        // SnapKit으로 레이아웃 설정
        profileImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(100)
        }
        
        followerLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(50)
        }
        
        followingLabel.snp.makeConstraints { make in
            make.top.equalTo(followerLabel)
            make.trailing.equalToSuperview().offset(-50)
        }
        
        profileManagingButton.snp.makeConstraints { make in
            make.top.equalTo(followerLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(40)
        }
        profileSharingButton.snp.makeConstraints { make in
            make.top.equalTo(profileManagingButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(40)
        }
    }
}
