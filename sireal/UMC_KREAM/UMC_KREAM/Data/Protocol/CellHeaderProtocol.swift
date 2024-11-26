//
//  CellHeaderProtocol.swift
//  UMC_KREAM
//
//  Created by 윤시진 on 11/19/24.
//

import Foundation
import UIKit

/// 셀의 헤더가 컴포넌트 정의 프로토콜
protocol CellHeaderProtocol {
    var headerTitle: UILabel { get }
    var headerSubTitle: UILabel { get }
}
