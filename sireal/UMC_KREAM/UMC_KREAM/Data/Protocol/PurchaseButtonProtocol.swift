//
//  PurchaseButtonProtocol.swift
//  UMC_KREAM
//
//  Created by 윤시진 on 11/19/24.
//

import Foundation
import UIKit

/// 커스텀 버튼의 공통 속성 지정
protocol PurchaseButtonProtocol {
    var priceLabel: UILabel { get set }
    var subLabel: UILabel { get set }
}
