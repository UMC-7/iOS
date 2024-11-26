//
//  PurchaseView.swift
//  UMC_KREAM
//
//  Created by 윤시진 on 11/25/24.
//

import UIKit

/// 상품 구매 뷰
class PurchaseView: UIView {
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Properties
    
    /// 대표 상품 이미지
    public lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    /// 상품 옵션 컬렉션 뷰
    public lazy var productCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 53, height: 53)
        layout.minimumInteritemSpacing = 8
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PurchaseCell.self, forCellWithReuseIdentifier: PurchaseCell.identifier)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    /// 가격 정보 라벨
    private lazy var priceTitleLabel: UILabel = makeLabel("즉시 구매가", UIFont.systemFont(ofSize: 12, weight: .light), color: .black)
    private lazy var priceLabel: UILabel = makeLabel("228,000원", UIFont.systemFont(ofSize: 20, weight: .semibold), color: .black)
    
    /// 상품 정보 라벨
    public lazy var productName: UILabel = makeLabel("Matin Kim Logo Coating Jumper", UIFont.systemFont(ofSize: 16, weight: .regular), color: .black)
    public lazy var productDescription: UILabel = makeLabel("마뗑킴 로고 코팅 점퍼 블랙", UIFont.systemFont(ofSize: 12, weight: .regular), color: UIColor(red: 0.612, green: 0.612, blue: 0.612, alpha: 1))
    
    /// 태그 버튼
    private lazy var tagBtn: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(named: "notTag")
        configuration.imagePlacement = .top
        configuration.imagePadding = 1
        
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        if let attributedTitle = try? AttributedString(
            "2,122",
            attributes: AttributeContainer([
                .foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 12, weight: .regular)
            ])
        ) {
            configuration.attributedTitle = attributedTitle
        }
        button.configuration = configuration
        return button
    }()
    
    /// 하단 버튼
    public lazy var leftPurchaseBtn: PurchaseButton = makeBottomButton(price: "345,000", subtitle: "즉시 구매가", type: .purchase)
    public lazy var rightSalesBtn: PurchaseButton = makeBottomButton(price: "396,000", subtitle: "즉시 판매가", type: .sales)
    
    /// 스택뷰
    private lazy var priceStack: UIStackView = createStackView([priceTitleLabel, priceLabel], spacing: 4)
    private lazy var productStack: UIStackView = createStackView([productName, productDescription], spacing: 6)
    private lazy var bottomButtonStack: UIStackView = createStackView([leftPurchaseBtn, rightSalesBtn], spacing: 10, axis: .horizontal)
    
    private lazy var bottomBackgroundView: PurchaseBottomBackground = {
        let view = PurchaseBottomBackground()
        view.addSubview(tagBtn)
        view.addSubview(bottomButtonStack)
        return view
    }()
    
    // MARK: - Functions
    
    private func makeLabel(_ text: String, _ font: UIFont, color: UIColor) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = color
        return label
    }
    
    private func makeBottomButton(price: String, subtitle: String, type: PurchaseButtonType) -> PurchaseButton {
        let button = PurchaseButton(frame: .zero, btnType: type)
        button.priceLabel.text = price
        button.subLabel.text = subtitle
        return button
    }
    
    private func createStackView(_ arrangedSubviews: [UIView], spacing: CGFloat, axis: NSLayoutConstraint.Axis = .vertical) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        return stackView
    }
    
    // MARK: - Setup Functions
    
    /// 구성 요소 추가
    private func setupViewHierarchy() {
        addSubview(productImageView)
        addSubview(productCollectionView)
        addSubview(priceStack)
        addSubview(productStack)
        addSubview(bottomBackgroundView)
    }
    
    /// 제약 조건 설정
    private func setupConstraints() {
        productImageView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(5)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(373)
        }
        
        productCollectionView.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.bottom).offset(20)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        priceStack.snp.makeConstraints {
            $0.top.equalTo(productCollectionView.snp.bottom).offset(23)
            $0.left.equalToSuperview().offset(16)
        }
        
        productStack.snp.makeConstraints {
            $0.top.equalTo(priceStack.snp.bottom).offset(18)
            $0.left.equalToSuperview().offset(16)
        }
        
        bottomBackgroundView.snp.makeConstraints {
            $0.bottom.left.right.equalToSuperview()
            $0.height.equalTo(95)
        }
        
        tagBtn.snp.makeConstraints {
            $0.left.equalToSuperview().offset(19)
            $0.top.equalToSuperview().offset(12)
        }
        
        bottomButtonStack.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.left.equalTo(tagBtn.snp.right).offset(19)
            $0.right.equalToSuperview().offset(-19)
            $0.height.equalTo(49)
        }
        
        leftPurchaseBtn.snp.makeConstraints {
            $0.width.equalTo(147)
        }
        
        rightSalesBtn.snp.makeConstraints {
            $0.width.equalTo(147)
        }
    }
}
