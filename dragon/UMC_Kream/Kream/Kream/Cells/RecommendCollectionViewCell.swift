//
//  RecommendCollectionViewCell.swift
//  Kream
//
//  Created by 권용빈 on 11/18/24.
//

import UIKit

class RecommendCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "RecommendCollectionCell"
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addStackView()
        addComponents()
        constaints()
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 상품 이미지
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    /// 상품 타이틀
    lazy var titleText: UILabel = makeLabel(font: UIFont.systemFont(ofSize: 12, weight: .semibold), UIColor.black)
    
    /// 상품 서브 타이틀
    lazy var subTitleText: UILabel = makeLabel(font: UIFont.systemFont(ofSize: 12, weight: .regular), UIColor.black)
    
    /// 상품 가격
    lazy var priceLabel: UILabel = makeLabel(font: UIFont.systemFont(ofSize: 13, weight: .semibold), UIColor.black)
    
    func makeLabel(font: UIFont, _ color: UIColor) -> UILabel {
        let label = UILabel()
        label.font = font
        label.textColor = color
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }
    
    
    override func prepareForReuse() {
        imageView.image = nil
        purchaseCount.text = nil
        tagButton.setImage(nil, for: .normal)
        
        titleText.text = nil
        subTitleText.text = nil
        
        priceLabel.text = nil
        priceDescription.text = nil
    }
    // MARK: - Property
    
    /// 상품 구매 수 라벨
    private lazy var purchaseCount: UILabel = makeLabel(font: UIFont.systemFont(ofSize: 10, weight: .regular), UIColor(red: 0.251, green: 0.272, blue: 0.294, alpha: 1))
    
    
    /// 이미지 백그라운드 랜덤 색상 적용
    private lazy var imageBackground: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 0.6
        )
        view.clipsToBounds = true
        view.layer.cornerRadius = 12
        return view
    }()
    
    /// 태그 버튼
    private lazy var tagButton: UIButton = {
        let btn = UIButton()
        return btn
    }()
    
    /// "즉시 구매가" 설명 라벨
    private lazy var priceDescription: UILabel = {
        let label = UILabel()
        label.text = "즉시 구매가"
        label.font = UIFont.systemFont(ofSize: 10, weight: .light)
        label.textColor = UIColor(red: 0.635, green: 0.635, blue: 0.635, alpha: 1)
        return label
    }()
    
    /// 상품 이름 및 설명 스택 뷰
    private lazy var productTitleStack: UIStackView = makeStackView(spacing: 3)
    
    /// 상품 가격 및 "즉시 구매가" 스택 뷰
    private lazy var priceTitleStack: UIStackView = makeStackView(spacing: 2)
    
    func makeStackView(spacing: CGFloat) -> UIStackView {
        let stack = UIStackView()
        stack.spacing = spacing
        stack.axis = .vertical
        stack.distribution = .fill
        return stack
    }
    //MARK: - Function
    
    /// 셀 데이터에서 클릭되었는가 안되었는가 값 전달받아 빈 태그 이미지 or 속이 찬 태그 이미지인지 구분
    /// - Parameter isMark: true flase로 전달
    /// - Returns: 빈 태그 이미지 or 속이 찬 태그 이미지 반환
    private func setTagButtonImage(isMark: Bool) -> UIImage {
        if isMark {
            return UIImage(named: "notTag.pdf") ?? UIImage()
        } else {
            return UIImage(named: "tag.pdf") ?? UIImage()
        }
    }
    
    /// 스택 뷰에 컴포넌트 추가
    private func addStackView() {
        [self.priceLabel, self.priceDescription].forEach{ priceTitleStack.addArrangedSubview($0) }
        [self.titleText, self.subTitleText].forEach{ productTitleStack.addArrangedSubview($0) }
    }
    
    /// 컴포넌트 추가
    private func addComponents() {
        [self.imageView, self.purchaseCount, self.tagButton].forEach{ self.imageBackground.addSubview($0) }
        [productTitleStack, priceTitleStack, imageBackground].forEach{ self.addSubview($0) }
    }
    
    /// 제약 조건 설정
    private func constaints() {
        imageBackground.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.left.equalToSuperview()
            $0.height.equalTo(142)
            $0.width.equalTo(142)
        }
        
        purchaseCount.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.right.equalToSuperview().offset(-8)
            $0.width.greaterThanOrEqualTo(48)
            $0.height.equalTo(12)
        }
        
        tagButton.snp.makeConstraints {
            $0.top.equalTo(purchaseCount.snp.bottom).offset(92)
            $0.right.bottom.equalToSuperview().offset(-10)
            $0.width.equalTo(14.2)
        }
        
        imageView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalToSuperview()
        }
        
        /* 상품 배경에 속해 있는 데이터 */
        
        productTitleStack.snp.makeConstraints {
            $0.top.equalTo(imageBackground.snp.bottom).offset(8)
            $0.left.equalToSuperview().offset(2)
            $0.width.equalToSuperview()
            $0.height.greaterThanOrEqualTo(25)
        }
        
        titleText.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(14)
        }
        
        subTitleText.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.greaterThanOrEqualTo(14)
        }
        
        priceTitleStack.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(0)
            $0.left.equalToSuperview().offset(2)
            $0.width.equalToSuperview()
            $0.height.equalTo(30)
        }
    }
    
}
