//
//  HomeView.swift
//  Kream
//
//  Created by 권용빈 on 11/10/24.
//

import UIKit
import Then

class HomeView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setViews()
        setConstaints()
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    // 세그먼트
    let segmentedControl = UISegmentedControl(items: ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]).then {
        //$0.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        //$0.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        //$0.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        //$0.setDividerImage(UIImage(), forLeftSegmentState: .selected,   rightSegmentState: .normal, barMetrics: .default)
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 12, weight: .light)
            ],
            for: .normal
        )
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 12, weight: .bold)
            ],
            for: .selected
        )
    }
    
    // 컬렉션뷰
    let selectCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 61, height: 81)
        $0.minimumInteritemSpacing = 9
        $0.minimumLineSpacing = 20
        //$0.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16) // 왼쪽, 오른쪽 여백 추가
    }).then {
        $0.backgroundColor = .clear
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
    
    // 콘텐츠 뷰 (scrollView 내부)
    private lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    // 스크롤 뷰
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    // recommedationLabel
    private lazy var recommendationLabel: UILabel = {
        let label = UILabel()
        label.text = "Just Dropped"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    // recoomendationSubLabel
    private lazy var recommendationSubLabel: UILabel = {
        let label = UILabel()
        label.text = "발매 상품"
        label.font = .systemFont(ofSize: 13)
        label.textColor = .lightGray
        return label
    }()
    
    // recommendationView
    public lazy var recommendationView: UICollectionView = {
        let recommendView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then{
            $0.estimatedItemSize = .init(width: 142, height: 237)
            $0.scrollDirection = .horizontal // 가로 스크롤 설정
            $0.minimumInteritemSpacing = 8
            $0.minimumLineSpacing = 16 // 아이템 간 가로 간격 조정

        }).then {
            $0.backgroundColor = .clear
            $0.showsHorizontalScrollIndicator = true // 필요 시 수평 스크롤 표시
            $0.isScrollEnabled = true
            $0.register(RecommendCollectionViewCell.self, forCellWithReuseIdentifier: RecommendCollectionViewCell.identifier)}
        return recommendView
    }()
    
    // storyView
    public lazy var storyView: UICollectionView = {
        let storyCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then{
            $0.estimatedItemSize = .init(width: 124, height: 165)
            $0.scrollDirection = .horizontal // 가로 스크롤 설정
            $0.minimumInteritemSpacing = 8
            $0.minimumLineSpacing = 16 // 아이템 간 가로 간격 조정

        }).then {
            $0.backgroundColor = .clear
            $0.showsHorizontalScrollIndicator = true // 필요 시 수평 스크롤 표시
            $0.isScrollEnabled = true
            $0.register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: StoryCollectionViewCell.identifier)}
        return storyCollectionView
    }()
    
    // MARK: - UI 추가
    private func setViews() {
        addSubview(scrollView) // 스크롤 뷰 추가
        scrollView.addSubview(contentView) // 콘텐츠 뷰 추가
        
        // 콘텐츠 뷰에 모든 UI 요소 추가
        [
            searchTextField,
            noticeButton,
            segmentedControl,
            bannerImageView,
            selectCollectionView,
            recommendationLabel,
            recommendationSubLabel,
            recommendationView,
            storyView
        ].forEach { contentView.addSubview($0) }
    }
    
    private func setConstaints() {
        // 스크롤 뷰 제약 조건
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        // 콘텐츠 뷰 제약 조건
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(scrollView)
            $0.bottom.equalTo(storyView.snp.bottom).offset(16) // 마지막 뷰의 bottom과 연결
        }
        
        searchTextField.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(6) // contentView 기준으로 변경
            $0.left.equalToSuperview().offset(16)
            $0.width.equalTo(303)
            $0.height.equalTo(40)
        }
        
        noticeButton.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(14) // contentView 기준으로 변경
            $0.right.equalToSuperview().offset(-16)
            $0.width.height.equalTo(24)
        }
        
        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(searchTextField.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-25)
        }
        
        bannerImageView.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
        }
        
        selectCollectionView.snp.makeConstraints {
            $0.top.equalTo(bannerImageView.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-17)
            $0.height.equalTo(250)
        }
        
        recommendationLabel.snp.makeConstraints{
            $0.top.equalTo(selectCollectionView.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
        }
        
        recommendationSubLabel.snp.makeConstraints{
            $0.top.equalTo(recommendationLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(16)
        }
        
        recommendationView.snp.makeConstraints {
            $0.top.equalTo(recommendationSubLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(250)
        }

        storyView.snp.makeConstraints {
            $0.top.equalTo(recommendationView.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(165)
            $0.bottom.equalToSuperview().offset(-16) // 마지막 요소의 bottom 연결
        }
    }
}
