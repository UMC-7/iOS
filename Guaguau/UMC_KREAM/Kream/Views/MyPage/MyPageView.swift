//
//  MyPageBottomView.swift
//  Kream
//
//  Created by 이은찬 on 11/6/24.
//

import UIKit

class MyPageView: UIView {

    //Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .gray
        addComponents()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //마이페이지 상단뷰
    public lazy var topView: MyPageTopView = {
        let view = MyPageTopView()
        view.backgroundColor = .white
        
        return view
    }()

    // 마이페이지 하단뷰
    private lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        return view
    }()
    
    
    
    //구성요소 추가
    private func addComponents() {
        addSubview(topView)
        addSubview(bottomView)
    }
    
    
    
    //제약조건
    private func constraints() {
        topView.snp.makeConstraints{
            $0.top.left.right.equalToSuperview()   //위, 왼쪽, 오른쪽을 Superview와 같게 하겠다(=붙이겠다)
            $0.bottom.equalTo(bottomView.snp.top).offset(-24)
        }
        
        bottomView.snp.makeConstraints{
            $0.left.right.bottom.equalToSuperview()
            $0.height.equalTo(460)
        }
    }
    
    
}
