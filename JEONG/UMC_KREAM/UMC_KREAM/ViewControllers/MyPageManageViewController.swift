//
//  MyPageManageViewController.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 10/8/24.
//

import UIKit

class MyPageManageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = ProfileManagerView()
        setNavigation()
    }

    private func setNavigation() {
        self.navigationItem.title = "프로필 관리"
        
        let backBtn = UIBarButtonItem(image: UIImage(systemName: "arrow.left")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor.black), style: .plain, target: self, action: #selector(didTap))
        navigationItem.leftBarButtonItem = backBtn
    }
    
    @objc func didTap() {
        navigationController?.popViewController(animated: true)
    }
}
