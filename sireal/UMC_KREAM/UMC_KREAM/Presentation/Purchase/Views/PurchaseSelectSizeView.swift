//
//  PurchaseSelectSizeView.swift
//  UMC_KREAM
//
//  Created by 윤시진 on 11/25/24.
//

import UIKit
import SnapKit

/// 사이즈 선택 뷰
class PurchaseSelectSizeView: UIView {

    // MARK: - Properties
    
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    private lazy var productNameLabel: UILabel = createLabel(fontSize: 14, color: .black)
    private lazy var productDescriptionLabel: UILabel = createLabel(fontSize: 12, color: .lightGray)
    
    public lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(SizeCell.self, forCellWithReuseIdentifier: SizeCell.identifier)
        return collectionView
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI() {
        self.backgroundColor = .white
        [productImageView, productNameLabel, productDescriptionLabel, collectionView].forEach { addSubview($0) }
    }
    
    private func layoutUI() {
        productImageView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.width.height.equalTo(91)
        }
        
        productNameLabel.snp.makeConstraints {
            $0.top.equalTo(productImageView)
            $0.leading.equalTo(productImageView.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        productDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(productNameLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalTo(productNameLabel)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().offset(-16)
        }
    }
    
    // MARK: - Configuration
    
    func configure(with data: ReceivePurchaseData) {
        productImageView.image = data.image
        productNameLabel.text = data.productName
        productDescriptionLabel.text = data.prodcutDescription
    }
    
    private func createLabel(fontSize: CGFloat, color: UIColor) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.textColor = color
        return label
    }
}
