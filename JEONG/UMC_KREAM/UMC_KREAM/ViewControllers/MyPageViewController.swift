//
//  MyPageViewController.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 10/8/24.
//

import UIKit

class MyPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = myPageView
    }
    
    private lazy var myPageView: MyPageView = {
        let view = MyPageView()
        view.topView.profileManageBtn.addTarget(self, action: #selector(changePage), for: .touchUpInside)
        return view
    }()
    
    @objc func changePage() {
        let changeVC = MyPageManageViewController()
        navigationController?.pushViewController(changeVC, animated: true)
    }
}
