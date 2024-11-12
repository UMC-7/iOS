//
//  HomeView.swift
//  Kream
//
//  Created by 권용빈 on 11/10/24.
//

import UIKit
import Then

class HomeView: UIView {
    
    // 세그먼트
    let segmentedControl = UISegmentedControl(items: ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]).then {
        //$0.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        //$0.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        //$0.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        //$0.setDividerImage(UIImage(), forLeftSegmentState: .selected,   rightSegmentState: .normal, barMetrics: .default)
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .light)
            ],
            for: .normal
        )
        $0.setTitleTextAttributes(
                [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .bold)
                ],
                for: .selected
            )
        }
    
    // 컬렉션뷰
    let selectCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 61, height: 81)
        $0.minimumInteritemSpacing = 9
    }).then {
        $0.backgroundColor = .gray
        $0.isScrollEnabled = false
        $0.register(HomeViewCollectionViewCell.self, forCellWithReuseIdentifier: HomeViewCollectionViewCell.identifier)
    }
    
    // 검색 텍스트필드
    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "브랜드, 상품, 프로필, 태그 등"
        textField.font = .systemFont(ofSize: 13.5)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 12
        
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        return textField
    }()
    
    // 알림 버튼
    private lazy var noticeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "notice.png"), for: .normal)
        return button
    }()
    
    // 이미지 배너
    private let bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "bannerImage.png")
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setViews()
        setConstaints()
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViews() {
        addSubview(searchTextField)
        addSubview(noticeButton)
        addSubview(segmentedControl)
        addSubview(bannerImageView)
        addSubview(selectCollectionView)
    }
    
    private func setConstaints() {
        searchTextField.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(6)
            $0.left.equalToSuperview().offset(16)
            $0.width.equalTo(303)
            $0.height.equalTo(40)
        }
        
        noticeButton.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(14)
            $0.right.equalToSuperview().offset(-16)
            $0.width.height.equalTo(24)
        }
        
        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(searchTextField.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(24)      // 왼쪽 여백 추가
            $0.trailing.equalToSuperview().offset(-25)    // 오른쪽 여백 추가
        }
        
        bannerImageView.snp.makeConstraints {
            $0.top.equalTo(searchTextField.snp.bottom).offset(43)
            $0.leading.equalToSuperview().offset(0)
            $0.trailing.equalToSuperview().offset(0)
        }
        
        selectCollectionView.snp.makeConstraints {
            $0.top.equalTo(bannerImageView.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-16)
            $0.height.equalTo(182)
        }
        
    }
}
