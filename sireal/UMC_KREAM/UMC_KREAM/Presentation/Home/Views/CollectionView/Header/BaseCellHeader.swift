//
//  BaseCellHeader.swift
//  UMC_KREAM
//
//  Created by 윤시진 on 11/19/24.
//

import UIKit
import SnapKit

/// 셀의 커스텀 헤더
class BaseCellHeader: UICollectionReusableView, CellHeaderProtocol {
    
    static let identifier: String = "BaseCellHeader"
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addComponents()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    lazy var headerTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = UIColor.black
        return label
    }()
    
    lazy var headerSubTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .light)
        label.textColor = UIColor.lightGray
        return label
    }()

    
    // 헤더타이틀, 헤더서브타이틀을 수직으로 배치하는 스택
    private lazy var headerStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4
        stack.distribution = .equalSpacing
        return stack
    }()

    
    // 헤더 스택에 타이틀과 서브 타이틀 추가
    private func addComponents() {
        [headerTitle, headerSubTitle].forEach{self.headerStack.addArrangedSubview($0)}
        self.addSubview(headerStack)
    }
    
    private func constraints() {
        
        headerStack.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.left.right.bottom.equalToSuperview()
        }
        
        headerTitle.snp.makeConstraints {
            $0.width.greaterThanOrEqualTo(200)
            $0.height.equalTo(19)
        }
        
        headerSubTitle.snp.makeConstraints {
            $0.width.greaterThanOrEqualTo(50)
            $0.height.equalTo(19)
        }
    }
    
    
    // 헤더에 표시할 제목과 서브 타이틀 설정
    public func configure(title: String, subTitle: String) {
        self.headerTitle.text = title
        self.headerSubTitle.text = subTitle
    }

}
