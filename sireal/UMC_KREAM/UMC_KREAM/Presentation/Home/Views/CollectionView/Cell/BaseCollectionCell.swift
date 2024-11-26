//
//  BaseCollectionCell.swift
//  UMC_KREAM
//
//  Created by 윤시진 on 11/19/24.
//

import UIKit

class BaseCollectionCell: UICollectionViewCell, ProductCellProtocol {
    func configure(model: any RequiredCellProtocol) {
        print("상속 받은 셀에서 오버라이드 하여 사용할 것!")
    }
    
    
    // MARK: - 초기화
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 
    // 재사용시 초기화
    override func prepareForReuse() {
        imageView.image = nil
        titleText.text = nil
        subTitleText.text = nil
        priceLabel.text = nil
    }
    
    //MARK: - Property
    // UICollectionViewCell 을 상속받았으므로 imageView 는 모든 자식 클래스에서 사용 가능
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        // 이미지를 셀 크기에 맞춰 비율 유지하며 꽉 채움
        imageView.contentMode = .scaleAspectFill
        // 셀 크기를 초과하는 이미지는 자르기
        imageView.clipsToBounds = true
        return imageView
    }()
    
    /// 상품 제목
    lazy var titleText: UILabel = makeLabel(font: UIFont.systemFont(ofSize: 12, weight: .semibold), UIColor.black)
    
    /// 상품 서브 타이틀
    lazy var subTitleText: UILabel = makeLabel(font: UIFont.systemFont(ofSize: 12, weight: .regular), UIColor.black)
    
    /// 상품 가격
    lazy var priceLabel: UILabel = makeLabel(font: UIFont.systemFont(ofSize: 13, weight: .semibold), UIColor.black)
    
    
    // 라벨 생성 공통 함수 (여러 라벨의 공통 로직을 한 곳에 정의하여 코드 중복 방지 !!)
    func makeLabel(font: UIFont, _ color: UIColor) -> UILabel {
        let label = UILabel()
        label.font = font
        label.textColor = color
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }
    
    // 스택뷰 생성
    func makeStackView(spacing: CGFloat) -> UIStackView {
        let stack = UIStackView()
        stack.spacing = spacing
        stack.axis = .vertical
        stack.distribution = .fill
        return stack
    }
    
    // 이미지 뷰의 코너 설정 --> 필요에 따라 다양한 코너값을 지정하기위해 함수로 분리한 것
    func imageViewCorner(cornerRadius: CGFloat) {
        self.imageView.layer.cornerRadius = cornerRadius
    }

}
