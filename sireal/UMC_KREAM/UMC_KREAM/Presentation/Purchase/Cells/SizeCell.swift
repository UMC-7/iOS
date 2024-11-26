//
//  SizeCell.swift
//  UMC_KREAM
//
//  Created by 윤시진 on 11/25/24.
//

import UIKit
import SnapKit

class SizeCell: UICollectionViewCell {
    
    static let identifier: String = "SizeCell"
    
    // MARK: - Properties
    
    private lazy var sizeLabel: UILabel = createLabel(fontSize: 14, color: .black)
    private lazy var priceLabel: UILabel = createLabel(fontSize: 12, color: .red)
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.clipsToBounds = true
        [sizeLabel, priceLabel].forEach { addSubview($0) }
    }
    
    private func layoutUI() {
        sizeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.centerX.equalToSuperview()
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(sizeLabel.snp.bottom).offset(1)
            $0.centerX.equalTo(sizeLabel.snp.centerX)
        }
    }
    
    // MARK: - Helpers
    
    private func createLabel(fontSize: CGFloat, color: UIColor) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.textColor = color
        label.textAlignment = .center
        return label
    }
    
    // MARK: - Configuration
    
    func configure(with model: SizeModel) {
        sizeLabel.text = model.size
        priceLabel.text = model.price
    }
    
    func updateSelectionState(isSelected: Bool) {
        let fontWeight: UIFont.Weight = isSelected ? .bold : .regular
        sizeLabel.font = UIFont.systemFont(ofSize: 14, weight: fontWeight)
        priceLabel.font = UIFont.systemFont(ofSize: 12, weight: fontWeight)
        self.layer.borderColor = isSelected ? UIColor.black.cgColor : UIColor.lightGray.cgColor
    }
}
