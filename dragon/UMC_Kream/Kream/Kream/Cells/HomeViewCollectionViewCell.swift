//
//  HomeViewCollectionViewCell.swift
//  Kream
//
//  Created by 권용빈 on 11/11/24.
//

import UIKit

class HomeViewCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "HomeViewCollectionViewCell"
    
    let imageView = UIImageView().then{
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = $0.frame.size.width / 2
        $0.clipsToBounds = true
    }
    
    let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 11.5)
        $0.textColor = .black
        $0.text = "Kream"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(imageView)
        addSubview(titleLabel)
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(61)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(4)
            //$0.bottom.lessThanOrEqualToSuperview()
            $0.height.equalTo(14)
        }
    }
}
