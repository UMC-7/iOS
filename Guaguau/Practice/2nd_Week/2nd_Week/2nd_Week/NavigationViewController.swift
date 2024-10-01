//
//  NavigationViewController.swift
//  2nd_Week
//
//  Created by 이은찬 on 10/1/24.
//

import UIKit

class NavigationViewController: UIViewController {

    private let label = UILabel()
    private let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "버튼을 누르면 네비게이션 방식의 화면 전환이 일어나요"
        label.textColor = .cyan
        
        button.setTitle("버튼을 눌러주세요",for: .normal)
        button.backgroundColor = .systemIndigo
        
        view.addSubview(label)
        view.addSubview(button)
        
        label.snp.makeConstraints {
            $0.top.equalToSuperview().offset(200)
            $0.centerX.equalToSuperview()
        }
        
        button.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(55)
            $0.width.equalTo(255)
        }
        
    button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
    }
    
    @objc
    private func buttonDidTap(){
        let viewController = UIViewController()
        
        viewController.view.backgroundColor = .lightGray
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}


