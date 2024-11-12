//
//  MenuCollectionViewCell.swift
//  UMC_KREAM
//
//  Created by 윤시진 on 11/10/24.
//

import UIKit
import SnapKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MenuCollectionViewCell"
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true // 이 부분이 누락된 경우 이미지가 잘리지 않을 수 있습니다.
        imageView.layer.cornerRadius = 35 // 이미지가 동그랗게 되도록 설정
        imageView.snp.makeConstraints {
                $0.top.equalToSuperview()
                $0.width.height.equalTo(70) // 이미지 크기 조정
                $0.centerX.equalToSuperview()
        }
        
        titleLabel.font = .systemFont(ofSize: 11.5)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with title: String, imageName: String) {
        titleLabel.text = title
        imageView.image = UIImage(named: imageName)
    }
}

