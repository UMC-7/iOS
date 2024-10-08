//
//  MyPageViewController.swift
//  Kream
//
//  Created by 권용빈 on 10/6/24.
//

import UIKit
class MyPageViewController: UIViewController {
    // MyPageView 인스턴스 생성
    private let myPageView = MyPageView()
    
    override func loadView() {
        self.view = myPageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 프로필 관리 버튼 누르면 관리 메뉴 이동
        myPageView.profileManagingButton.addTarget(self, action: #selector(goToProfileManagement), for: .touchUpInside)
    }
    
    @objc private func goToProfileManagement() {
        let profileVC = ProfileManagementViewController()
        self.navigationController?.pushViewController(profileVC, animated: true)
    }
}
