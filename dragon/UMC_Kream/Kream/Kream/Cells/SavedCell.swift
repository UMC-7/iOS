//
//  SavedCell.swift
//  Kream
//
//  Created by 권용빈 on 11/6/24.
//

import UIKit

class SavedCell: UITableViewCell {
    
    static let identifier = "SavedCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
        setConstaints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        savedImageView.image = nil
        savedName.text = nil
        savedText.text = nil
        savedPrice.text = nil
        savedBookmark.setImage(nil, for: .normal)
    }
    
    private lazy var savedImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var savedName: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        name.textColor = .black
        return name
    }()
    
    private lazy var savedText: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 14, weight: .light)
        text.textColor = .lightGray
        return text
    }()
    
    private lazy var savedLabelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var savedPrice: UILabel = {
        let price = UILabel()
        price.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        price.textColor = .black
        price.textAlignment = .right
        return price
    }()
    
    private lazy var savedBookmark: UIButton = {
        let bookmark = UIButton()
        return bookmark
    }()
    
    private func setViews() {
        self.savedLabelStackView.addArrangedSubview(savedName)
        self.savedLabelStackView.addArrangedSubview(savedText)
        self.addSubview(savedImageView)
        self.addSubview(savedLabelStackView)
        self.addSubview(savedPrice)
        self.addSubview(savedBookmark)
    }
    
    
    
    private func setConstaints() {
        savedImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(13)
            $0.left.equalToSuperview().offset(13)
            $0.bottom.equalToSuperview().offset(-14)
            $0.width.equalTo(72)
        }
      
        
        savedLabelStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(13)
            $0.left.equalTo(savedImageView.snp.right).offset(13)
            $0.width.lessThanOrEqualTo(240)
            $0.height.equalTo(54)
        }
        
        
        savedName.snp.makeConstraints {
            $0.height.equalTo(19)
            $0.width.lessThanOrEqualTo(240)
        }
        savedText.snp.makeConstraints {
            $0.height.equalTo(33)
            $0.width.lessThanOrEqualTo(240)
        }
        savedBookmark.snp.makeConstraints{
            $0.top.equalToSuperview().offset(18)
            $0.right.equalToSuperview().offset(-17)
            $0.width.equalTo(14)
            $0.height.equalTo(18)
        }
        
        savedPrice.snp.makeConstraints {
            $0.top.equalTo(savedBookmark.snp.bottom).offset(31)
            $0.right.equalToSuperview().offset(-16)
            $0.width.greaterThanOrEqualTo(66)
            $0.height.equalTo(22)
        }
        
        
        
    }
    
    public func configure(model: SavedModel){
        self.savedImageView.image = UIImage(named: model.savedImage)
        self.savedName.text = model.savedName
        self.savedText.text = model.savedText
        self.savedPrice.text = "\(String(model.savedPrice))원"
        self.savedBookmark.setImage(UIImage(named: "bookmark.pdf"), for: .normal)
    }
}
