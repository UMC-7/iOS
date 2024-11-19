//
//  MyPageViewController.swift
//  Kream
//
//  Created by 이은찬 on 11/11/24.
//

import UIKit

class MyPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = myPageView
    }
    
    //마이페이지 뷰
    private lazy var myPageView: MyPageView = {
        let view = MyPageView()
        view.topView.profileManageButton.addTarget(self, action: #selector(changePage), for: .touchUpInside)
        return view
    }()
    
    //프로필 관리 버튼을 통해 프로필 수정 페이지로 이동
    @objc func changePage() {
        let changeVC = ProfileManageViewController()
        navigationController?.pushViewController(changeVC, animated: true)
    }
    

}
