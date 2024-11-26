//
//  ProductCellProtocol.swift
//  UMC_KREAM
//
//  Created by 윤시진 on 11/19/24.
//

import Foundation
import UIKit

/// 크림 상품 셀에 사용할 프로토콜
protocol ProductCellProtocol {
    var imageView: UIImageView { get }
    var titleText: UILabel { get }
    var priceLabel: UILabel { get }
    
    func configure(model: RequiredCellProtocol)
}
