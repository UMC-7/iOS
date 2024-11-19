//
//  StoryCollectionViewCell.swift
//  Kream
//
//  Created by 권용빈 on 11/19/24.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "StoryCollectionViewCell"
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addComponents()
        constraints()
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = false
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .white
        label.textAlignment = .left
        return label
        
    }()
    

    private func addComponents() {
        [self.imageView, self.userNameLabel].forEach{ self.addSubview($0) }
    }
    
    private func constraints() {
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    
        userNameLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(11)
            $0.bottom.equalToSuperview().offset(-10)
            $0.width.greaterThanOrEqualTo(60)
            $0.height.equalTo(14)

        }
    }
}
