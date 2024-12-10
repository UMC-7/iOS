//
//  CellHeaderProtocol.swift
//  Kream
//
//  Created by 권용빈 on 11/26/24.
//

import UIKit

/// 셀의 헤더가 컴포넌트 정의 프로토콜
protocol CellHeaderProtocol {
    var headerTitle: UILabel { get }
    var headerSubTitle: UILabel { get }
}
