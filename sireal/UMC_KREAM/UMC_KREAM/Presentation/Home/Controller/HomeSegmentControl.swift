//
//  HomeSegmentControl.swift
//  UMC_KREAM
//
//  Created by 윤시진 on 11/19/24.
//

import UIKit

class HomeSegmentControl: UISegmentedControl {
    
    // 선택된 탭 아래에 표시되는 하단 막대
    let selectedIndicator = UIView()
    
    // 선택된 탭에 표시될 아이템을 배열로 받아오기
    init(items: [String]) {
        super.init(items: items)
        configureSegmentControl()
        selectedSegmentIndicator()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        updateIndicatorPosition(animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private func configureSegmentControl(){
        // 배경색 제거
        self.backgroundColor = UIColor.clear
        // 경계선 제거
        self.selectedSegmentTintColor = UIColor.clear
        
        let clearImage = UIImage()
        setBackgroundImage(clearImage, for: .normal, barMetrics: .default)
        setBackgroundImage(clearImage, for: .selected, barMetrics: .default)
        setDividerImage(clearImage, forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        
        // 세그먼트 선택 O (검은색, 굵음) + 세크먼트 선택 X (회색, 얇음)
        let selectedAttributes = makeAttributes(color: UIColor.black, weight: .bold)
        let normalAttributes = makeAttributes(color: UIColor.darkGray, weight: .regular)
        
        setTitleTextAttributes(selectedAttributes, for: .selected)
        setTitleTextAttributes(normalAttributes, for: .normal)
        
        // 세그먼트 클릭시 segmentChange 메서드 호출
        addTarget(self, action: #selector(segmentChange), for: .valueChanged)
    }
    
    // 텍스트 스타일 설정
    private func makeAttributes(color: UIColor, weight: UIFont.Weight) -> [NSAttributedString.Key: Any] {
        var value = [NSAttributedString.Key: Any]()
        value[.foregroundColor] = color
        value[.font] = UIFont.systemFont(ofSize: 16, weight: weight)
        return value
    }
}


extension HomeSegmentControl {
    
    // 하단 막대 설정
    private func selectedSegmentIndicator() {
        selectedIndicator.backgroundColor = UIColor.black
        // 첫번째 탭 기본으로 선택
        selectedSegmentIndex = 0
        addSubview(selectedIndicator)
        // 막대의 초기 위치 설정
        updateIndicatorPosition(animated: false)
    }
    
    // 선택된 탭 아래로 막대를 이동
    private func updateIndicatorPosition(animated:Bool){
        
        // 세그먼트 컨트롤의 전체 너비를 탭 개수로 나누어 탭 너비 구하기
        let segmentWidth = bounds.width / CGFloat(numberOfSegments)
        
        // 텍스트 아래에 막대가 깔끔하게 위치하도록 조정
        let leftOffset: CGFloat = 1
        
        // 선택된 세그먼트의 텍스트 길이에 맞게 막대의 너비 설정
        let indicatorWidth = calculateLabelWidth(for: selectedSegmentIndex)
        
        // 막대 크기와 위치 계산
        let indicatorPositionX = segmentWidth * CGFloat(selectedSegmentIndex) + (segmentWidth - indicatorWidth) / 2 - leftOffset
        let indicatorFrame = CGRect(x: indicatorPositionX, y: bounds.height - 3, width: indicatorWidth, height: 2)
        
        // 새로운 위치 적용
        if animated {
            UIView.animate(withDuration: 0.3, animations: {
                self.selectedIndicator.frame = indicatorFrame
            })
        } else {
            self.selectedIndicator.frame = indicatorFrame
        }
    }

        
        // 현재 선택된 탭의 텍스트 사이즈 계산
        private func calculateLabelWidth(for index: Int) -> CGFloat {
            guard let title = titleForSegment(at: index) else { return 0 }
            let attributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 16, weight: .bold)]
            let textSize = (title as NSString).size(withAttributes: attributes)
            return textSize.width
        }

        // 탭 전환 메서드 (선택된 탭으로 막대를 부드럽게 이동)
        @objc private func segmentChange() {
            updateIndicatorPosition(animated: true)
        }
}
