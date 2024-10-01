//
//  CountUpDownView.swift
//  practice_1-1
//
//  Created by 권용빈 on 9/24/24.
//

import UIKit
class CountUpDownView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var attributeStyle: AttributeContainer = {
        var style = AttributeContainer()
        style.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        style.foregroundColor = UIColor.black
        return style
    }()
    
    public lazy var countLabel: UILabel = {
        let text = UILabel()
        
        text.font = UIFont.systemFont(ofSize: 42, weight: .bold)
        text.textColor = .black
        text.text = "1"
        text.textAlignment = .center
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    } ()
    
    public lazy var upBtn: UIButton = {
        let btn = UIButton()
        
        var configuration = UIButton.Configuration.plain()
        
        configuration.image = UIImage(systemName: "arrowtriangle.up.fill")
        configuration.imagePlacement = .top
        configuration.imagePadding = 5
        
        configuration.titleAlignment = .center
        configuration.attributedTitle = AttributedString("숫자 올리기", attributes: attributeStyle)
        
        btn.configuration = configuration
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    public lazy var downBtn: UIButton = {
        let btn = UIButton()
        
        var configuration = UIButton.Configuration.plain()
        
        configuration.image = UIImage(systemName: "arrowtriangle.down.fill")
        configuration.imagePlacement = .top
        configuration.imagePadding = 5
        
        configuration.titleAlignment = .center
        configuration.attributedTitle = AttributedString("숫자 내리기", attributes: attributeStyle)
        
        btn.configuration = configuration
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func constraints(){
        self.addSubview(countLabel)
        self.addSubview(upBtn)
        self.addSubview(downBtn)
        
        NSLayoutConstraint.activate([
            countLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 327),
            countLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 110.5),
            countLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -110.5),
            
            downBtn.topAnchor.constraint(equalTo: self.countLabel.bottomAnchor, constant: 17),
            downBtn.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 93.5),
            downBtn.rightAnchor.constraint(equalTo: self.upBtn.leftAnchor, constant: -4),
            
            upBtn.topAnchor.constraint(equalTo: self.countLabel.bottomAnchor, constant: 17),
            upBtn.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -93.5)
            
            
        ])
    }
                                                    
}
