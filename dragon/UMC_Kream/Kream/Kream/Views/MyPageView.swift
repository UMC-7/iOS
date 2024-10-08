//
//  MyPageView.swift
//  Kream
//
//  Created by 권용빈 on 10/8/24.
//

import UIKit

class MyPageView: UIView {
    
    //MARK: - 초기화 구문
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //설정 버튼 아이콘
    private lazy var settingsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "gearshape"), for: .normal)
        return button
    }()
    
    // 카메라 아이콘
    private lazy var cameraButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "camera"), for: .normal)
        return button
    }()
    
    // 첫 번째 StackView: 설정 아이콘과 카메라 아이콘
    private lazy var topIconsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [settingsButton, cameraButton])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    // 프로필 이미지
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profileImage")
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // 이름 라벨
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Jeong_iOS"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    // 팔로워 라벨
    private lazy var followerLabel: UILabel = {
        let label = UILabel()
        label.text = "팔로워 326명"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    // 팔로잉 라벨
    private lazy var followingLabel: UILabel = {
        let label = UILabel()
        label.text = "팔로잉 20명"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    // 팔로워와 팔로잉을 묶는 StackView (수평)
    private lazy var followerFollowingStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [followerLabel, followingLabel])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    // infoStackView: 이름, 팔로워 & 팔로잉
    private lazy var infoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, followerFollowingStackView])
        stackView.axis = .vertical
        stackView.alignment = .leading // 가운데 정렬
        stackView.spacing = 6
        return stackView
    }()
    
    // 프로필 스택뷰
    private lazy var profileStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [profileImageView, infoStackView])
        stackView.axis = .horizontal // 수평으로 배치
        stackView.alignment = .center // 수평 가운데 정렬
        stackView.spacing = 16 // 프로필 이미지와 이름 정보 사이의 간격
        return stackView
    }()
    
    
    // 프로필 관리 버튼
    public lazy var profileManagingButton: UIButton = {
        let button = UIButton()
        button.setTitle("프로필 관리", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 9)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.lightGray.cgColor // 테두리 색상
        button.layer.borderWidth = 1 // 테두리 두께
        button.layer.cornerRadius = 8 // 모서리 둥글게
        return button
    }()
    
    // 프로필 공유 버튼
    private lazy var profileSharingButton: UIButton = {
        let button = UIButton()
        button.setTitle("프로필 공유", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 9)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.lightGray.cgColor // 테두리 색상
        button.layer.borderWidth = 1 // 테두리 두께
        button.layer.cornerRadius = 8 // 모서리 둥글게
        return button
    }()
    
    // 세 번째 StackView: 프로필 관리 버튼과 프로필 공유 버튼 (수평)
    private lazy var profileButtonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [profileManagingButton, profileSharingButton])
        stackView.axis = .horizontal
        stackView.spacing = 14
        return stackView
    }()
    
    // 전체 포함 StackView (수직)
    private lazy var topMainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [topIconsStackView, profileStackView, profileButtonStackView])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 26
        return stackView
    }()
    
    
    
    private func addComponents() {
        addSubview(topMainStackView)
        constraints()
        
        func constraints() {
            topMainStackView.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(75)
                make.leading.equalToSuperview().offset(32.5)
                make.trailing.equalToSuperview().offset(-32.5)
            }
            
            //상단 아이콘 버튼들 스택뷰
            topIconsStackView.snp.makeConstraints{ make in
                make.top.equalToSuperview()
            }
            
            // 상단 좌측 설정 아이콘
            settingsButton.snp.makeConstraints { make in
                make.leading.equalToSuperview()
                make.width.height.equalTo(25)
            }
            
            // 상단 우측 카메라 아이콘
            cameraButton.snp.makeConstraints { make in
                make.trailing.equalToSuperview()
                make.width.height.equalTo(25)
            }
            
            // 프로필 stackView
            profileStackView.snp.makeConstraints{ make in
                make.top.equalTo(topIconsStackView.snp.bottom).offset(26)
            }
            
            // 프로필 이름, 팔로잉, 팔로워 스택 뷰
            infoStackView.snp.makeConstraints{ make in
                make.width.equalTo(115)
            }
            
            // 프로필 이미지
            profileImageView.snp.makeConstraints { make in
                make.width.height.equalTo(90)
            }
            
            //프로필 버튼 스택 뷰
            profileButtonStackView.snp.makeConstraints{ make in
                make.top.equalTo(profileStackView.snp.bottom).offset(26)
            }
            
            // 프로필 관리 버튼
            profileManagingButton.snp.makeConstraints { make in
                make.width.equalTo(157)
                make.height.equalTo(26)
            }
            
            // 프로필 공유 버튼
            profileSharingButton.snp.makeConstraints { make in
                make.width.equalTo(157)
                make.height.equalTo(26)
            }
            
        }
    }
}
