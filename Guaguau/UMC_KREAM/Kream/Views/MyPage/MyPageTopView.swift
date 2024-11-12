//
//  MyPageView.swift
//  Kream
//
//  Created by 이은찬 on 10/8/24.
//

import UIKit

class MyPageTopView: UIView {
    
    
    //Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        addComponents()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //환경설정 버튼
    private lazy var optionIcon: UIButton = iconButton(image: "Option")
    
    //카메라 버튼
    private lazy var cameraIcon: UIButton = iconButton(image: "Camera")
    
    //아이콘(환경설정, 카메라) 스택뷰
    private lazy var iconStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.spacing = 284.5
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        
        return stackView
    }()
    
    
    //유저프로필사진
    private lazy var profileImage: UIImageView = {
       let imageView = UIImageView()
        
        imageView.image = UIImage(named: "ProfileImage")
        
        return imageView
    }()
    
    //유저이름
    private lazy var userName: UILabel = {
        let userName = UILabel()
        userName.text = "Jeong_iOS"
        userName.font = .systemFont(ofSize: 16, weight: .bold)
        userName.textColor = .black
        
        return userName
    }()
    
    
    //유저 팔로워 수 라벨
    private lazy var userFollower: UILabel = followLabel(text: "팔로워", number: 326)
    
    //유저 팔로잉 수 라벨
    private lazy var userFollowing: UILabel = followLabel(text: "팔로잉", number: 20)
    
    //유저 팔로우 스택뷰
    private lazy var userFollowStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        
        return stackView
    }()
    
    
    //프로필 관리 버튼
    public lazy var profileManageButton: UIButton = profileButton(text: "프로필 관리")
    
    //프로필 공유 버튼
    public lazy var profileShareButon: UIButton = profileButton(text: "프로필 공유")
    
    //프로필 버튼 스택뷰
    private lazy var profileButtonStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.spacing = 14
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        
        return stackView
    }()
    
    
    //구성요소 추가
    private func addComponents(){
        
        self.addSubview(iconStackView)
        iconStackView.addArrangedSubview(optionIcon)
        iconStackView.addArrangedSubview(cameraIcon)
        
        self.addSubview(profileImage)
        self.addSubview(userName)
        
        self.addSubview(userFollowStackView)
        userFollowStackView.addArrangedSubview(userFollower)
        userFollowStackView.addArrangedSubview(userFollowing)
        
        self.addSubview(profileButtonStackView)
        profileButtonStackView.addArrangedSubview(profileManageButton)
        profileButtonStackView.addArrangedSubview(profileShareButon)
        
    }
    
    
    //제약조건
    private func constraints(){
        
        //아이콘 스택뷰
        iconStackView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(75)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(25)
            $0.width.equalTo(328)
        }
        
        optionIcon.snp.makeConstraints{
            $0.height.equalTo(22)
            $0.width.equalTo(25)
        }
        
        cameraIcon.snp.makeConstraints{
            $0.height.equalTo(22)
            $0.width.equalTo(25)
        }
        
        
        //유저프로필사진
        profileImage.snp.makeConstraints{
            $0.top.equalToSuperview().offset(126)
            $0.height.equalTo(90)
            
            $0.left.equalToSuperview().offset(32.5)
            $0.width.equalTo(90)
        }
        
        //유저이름라벨
        userName.snp.makeConstraints{
            $0.top.equalTo(iconStackView.snp.bottom).offset(47)
            $0.height.equalTo(23)
            
            $0.left.equalToSuperview().offset(138.5)
            $0.right.equalToSuperview().offset(-139.5)
            $0.width.equalTo(115)
        }
        
        //유저 팔로우 스택뷰
        userFollowStackView.snp.makeConstraints{
            $0.top.equalTo(userName.snp.bottom).offset(6)
            $0.height.equalTo(19)
            
            $0.left.equalToSuperview().offset(138.5)
            $0.right.equalToSuperview().offset(-139.5)
            $0.width.equalTo(115)
        }
        
        userFollower.snp.makeConstraints{
            $0.width.equalTo(57)
        }
        userFollowing.snp.makeConstraints{
            $0.width.equalTo(57)
        }
        
        
        //프로필버튼 스택뷰
        profileButtonStackView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(242)
            $0.height.equalTo(26)
            
            $0.centerX.equalToSuperview()
            $0.width.equalTo(328)
        }
        
    }
    
    
    //MARK: 함수
    
    //아이콘(환경설정, 카메라) 버튼 함수
    private func iconButton(image: String) -> UIButton {
        let button = UIButton()
        
        button.setImage(UIImage(named: image), for: .normal)
        
        return button
    }
    
    //팔로워, 팔로잉 라벨 함수
    private func followLabel(text: String, number: Int) -> UILabel{
        let label = UILabel()
        
        let textValue = text + " " + String(number)
        
        let attributedText = NSMutableAttributedString(string: textValue)
        attributedText.addAttribute(.font, value: UIFont.systemFont(ofSize: 12, weight: .regular), range: NSRange(location: 0, length: text.count))
        attributedText.addAttribute(.font, value: UIFont.systemFont(ofSize: 12, weight: .bold), range: NSRange(location: text.count, length: String(number).count + 1))
        
        label.attributedText = attributedText
        label.textColor = UIColor.black
        
        return label
    }
    
    //프로필 관리,공유 버튼 함수
    private func profileButton(text: String) -> UIButton {
        let button = UIButton()
        
        button.setTitle(text, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 9, weight: .regular)
        button.setTitleColor(.black, for: .normal)
        
        //버튼 테두리
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        
        return button
    }
    
    
    

}
