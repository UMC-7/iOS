//
//  CountUpDownView.swift
//  1st_Week
//
//  Created by 이은찬 on 11/5/24.
//

import UIKit
import SnapKit

class CountUpDownView: UIView {

    override init(frame: CGRect){
        super.init(frame: frame)        //VC에 초기화를 위임하겠다
        self.backgroundColor = .white
        
        self.addComponents()            //View에 넣기
        self.constraints()              //View에 넣기
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //카운트 표시 라벨
    public lazy var countLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 40, weight: .bold)
        label.textColor = UIColor.black
        label.text = "1"
        label.textAlignment = .center   //중앙정렬
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    //버튼 내부 텍스트(숫자 내리기, 올리기) 폰트 지정 컨테이너
    private lazy var titleContainer: AttributeContainer = {
        var container = AttributeContainer()
        
        container.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        container.foregroundColor = UIColor.black
        
        return container
    }()
    
    
    //숫자 업 버튼
    public lazy var countUpButton: UIButton = button(title: "숫자 올리기", imageName: "arrowtriangle.up.fill")
    
    
    //숫자 다운 버튼
    public lazy var countDownButton: UIButton = button(title: "숫자 내리기", imageName: "arrowtriangle.down.fill")
    
   
    //버튼 스택뷰
    private lazy var buttonStackView: UIStackView = {
       let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        
        //테두리
        stackView.layer.borderColor = UIColor.black.cgColor
        stackView.layer.borderWidth = 1
        
        return stackView
    }()
    
    
    //구성요소 추가 -> 현재뷰인 CountUpDownView에 서브뷰들(버튼, 라벨) 추가 -> 크기, 위치 조정 -> View에 넣어주기
    private func addComponents(){
        self.addSubview(countLabel)
        self.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(countUpButton)      //addArrangedSubview -> 정렬해서 넣겠다
        buttonStackView.addArrangedSubview(countDownButton)
    }
    
    //제약조건(크기, 위치)
    private func constraints(){
       
        //카운트 라벨
        countLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(327)
            //$0.bottom.equalTo(buttonStackView.snp.top).offset(-17)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(172)
            $0.height.equalTo(120)
        }
        
        //버튼스택뷰 -> 들어갈 컨텐츠의 가로/세로 줘야함
        buttonStackView.snp.makeConstraints{
            $0.top.equalTo(countLabel.snp.bottom).offset(17)
            //$0.bottom.equalToSuperview().offset(-398)
            $0.left.equalToSuperview().offset(100)
            $0.width.greaterThanOrEqualTo(210)      //210보다 크거나 같게끔 하겠다
            $0.height.equalTo(60)
        }
        
        countUpButton.snp.makeConstraints{
            $0.width.equalTo(101)
            //$0.left.equalToSuperview().offset(0) //버튼의 SuperView(스택)의 맨 왼쪽에 붙이겠다
        }
        
        countDownButton.snp.makeConstraints{
            $0.width.equalTo(101)
            //$0.right.equalToSuperView().offset(0)  //버튼의 SuperView(스택)의 맨 오른쪽에 붙이겠다
        }
    }
    
    
    //버튼 함수
    public func button(title: String, imageName: String) -> UIButton{
        let btn = UIButton()
        
        var configuration = UIButton.Configuration.plain()  //UIButton.Configuration -> 버튼 설정(꾸밈)
        configuration.image = UIImage(systemName: imageName)?.withRenderingMode(.alwaysOriginal).withTintColor(.black)
        configuration.imagePlacement = .top
        configuration.imagePadding = 5
        
        configuration.attributedTitle = AttributedString(title, attributes: titleContainer)
        configuration.titleAlignment = .center
        
        btn.configuration = configuration
        
        return btn
    }

}
