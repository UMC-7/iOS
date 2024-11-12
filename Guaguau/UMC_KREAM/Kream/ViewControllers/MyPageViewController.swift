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
    
    
    //커스텀한 마이페이지 뷰
    private lazy var myPageView: MyPageView = {
        let view = MyPageView()
        //view.topView.profileManageButton.addTarget(self, action: #selector(changePage), for: .touchUpInside)
        return view
    }()
    

}
