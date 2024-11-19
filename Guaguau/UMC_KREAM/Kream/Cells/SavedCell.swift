//
//  SavedCell.swift
//  Kream
//
//  Created by 이은찬 on 11/12/24.
//

import UIKit

class SavedCell: UITableViewCell {

    static let identifier = "SavedCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        productImageView.image = nil
        titleLabel.text = nil
        subTitleLabel.text = nil
        priceLabel.text = nil
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addComponents()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //Property
    
    //상품 이미지
    private lazy var productImageView: UIImageView = {
         let imageView = UIImageView()
         imageView.contentMode = .scaleAspectFit
         imageView.clipsToBounds = true
         imageView.layer.cornerRadius = 10
        
         return imageView
     }()
    
    //태그
    private lazy var tagImage: UIImageView = UIImageView.init(image: UIImage(named: "Tag"))
    
    //타이틀 라벨
    private lazy var titleLabel: UILabel = makeLabel(font: UIFont.systemFont(ofSize: 12, weight: .semibold), color: UIColor.black)
    
    //서브 타이틀 라벨
       private lazy var subTitleLabel: UILabel = makeLabel(font: UIFont.systemFont(ofSize: 9, weight: .medium), color: UIColor.lightGray)
    
    //가격 라벨
       private lazy var priceLabel: UILabel = makeLabel(font: UIFont.systemFont(ofSize: 14, weight: .semibold), color: UIColor.black)
    
    //라벨 스택뷰
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.distribution = .fill
        return stackView
    }()
    
    
    
    //오토레이아웃
    private func addComponents() {
        self.addSubview(productImageView)
        self.addSubview(tagImage)
        self.addSubview(priceLabel)
        
        self.addSubview(labelStackView)
        labelStackView.addArrangedSubview(titleLabel)
        labelStackView.addArrangedSubview(subTitleLabel)
    }
    
    private func constraints() {
        productImageView.snp.makeConstraints {
            $0.left.top.equalToSuperview().offset(13)
            $0.height.width.equalTo(72)
        }
        
        labelStackView.snp.makeConstraints {
            $0.left.equalTo(productImageView.snp.right).offset(13)
            $0.top.equalToSuperview().offset(13)
            $0.width.equalTo(153)
            $0.height.equalTo(54)
        }
        
        tagImage.snp.makeConstraints {
            $0.right.equalToSuperview().offset(-17)
            $0.top.equalToSuperview().offset(18)
            $0.width.equalTo(14)
            $0.height.equalTo(18)
        }
        
        priceLabel.snp.makeConstraints {
            $0.right.equalToSuperview().offset(-16)
            $0.top.equalToSuperview().offset(67)
            $0.width.lessThanOrEqualTo(120)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.height.equalTo(33)
        }
    }
    
    
    //함수
    //라벨
    private func makeLabel(font: UIFont, color: UIColor) -> UILabel {
        let label = UILabel()
        label.textColor = color
        label.font = font
        label.numberOfLines = 2
        
        return label
    }
    
    
    //Cell에 사용하는 데이터 모델
    public func configure(model: SavedProduct) {
        self.productImageView.image = UIImage(named: model.image)
        self.titleLabel.text = model.description.title
        self.subTitleLabel.text = model.description.subtitle
        self.priceLabel.text = "\(formatPrice(model.price))원"
    }
    
    //가격을 3자리마다 쉼표를 찍는 형식으로 변환
    private func formatPrice(_ price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: price)) ?? "\(price)"
    }

    
}
