//
//  ProductCellProtocol.swift
//  Kream
//
//  Created by 권용빈 on 11/26/24.
//

import UIKit

/// 크림 상품 셀에 사용할 프로토콜
protocol ProductCellProtocol {
    var imageView: UIImageView { get }
    var titleText: UILabel { get }
    var priceLabel: UILabel { get }
    
    func configure(model: RequiredCellProtocol)
}
