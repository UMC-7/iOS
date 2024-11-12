//
//  TeenipingView.swift
//  4th_Week
//
//  Created by 이은찬 on 11/5/24.
//

import UIKit


class TeenipingView: UIView {
    
    let segmentedControl = UISegmentedControl(items: ["티니핑", "not 티니핑"]).then{
        $0.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        $0.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        $0.selectedSegmentIndex = 0
        $0.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.black,.font: UIFont.systemFont(ofSize: 16, weight: .light)
        ],
                                  for:.normal)
        $0.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.black,.font: UIFont.systemFont(ofSize: 16, weight: .bold)
            ],
                                  for:.selected)
    }
    
    let teenipingCollectionView = UICollectionView()
    
    private let divideLine = UIView().then{
        $0.backgroundColor = .black
    }
    
    private let emptyLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 24, weight: .medium)
        $0.textColor = .black
        $0.text = "횅~~"
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        backgroundColor = .white
        
        setupView()
        
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        [segmentedControl,
         teenipingCollectionView,
         divideLine,
         emptyLabel
        ].forEach{
            addSubview($0)
        }
        
        segmentedControl.snp.makeConstraints{
            $0.top.equalTo(safeAreaLayoutGuide).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(92)
        }
        
        divideLine.snp.makeConstraints{
            $0.top.equalTo(segmentedControl.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        /*teenipingCollectionView.snp.makeConstraints{
            $0.top.equalTo(divideLine.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(19)
            $0.bottom.equalToSuperview().inset(74)
        }*/
        
        emptyLabel.snp.makeConstraints{
            $0.top.equalTo(divideLine.snp.bottom).offset(301)
            $0.centerX.equalToSuperview()
        }
    }
}
