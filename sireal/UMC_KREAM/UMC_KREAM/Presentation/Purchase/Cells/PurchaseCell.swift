//
//  PurchaseCell.swift
//  UMC_KREAM
//
//  Created by 윤시진 on 11/25/24.
//

import UIKit
import SnapKit

class PurchaseCell: UICollectionViewCell {
    
    static let identifier: String = "PurchaseCollectionViewCell"
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        self.imageView.image = nil
    }
    
    // MARK: - Property
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    // MARK: - Function
    

    private func constraints() {
        self.addSubview(imageView)
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    public func configure(model: any RequiredCellProtocol) {

        guard let purchaseData = model as? PurchaseModel else { return }
        self.imageView.image = UIImage(named: purchaseData.imageView)
    }
    
}
