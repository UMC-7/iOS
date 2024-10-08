//
//  ProfileManagementViewController.swift
//  Kream
//
//  Created by 권용빈 on 10/8/24.
//

import UIKit

class ProfileManagementViewController: UIViewController {
    
    private lazy var profileView: ProfileManagementView = {
        let view = ProfileManagementView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = profileView
        setNavigation()
    }
    
    private func setNavigation() {
        self.navigationItem.title = "프로필 관리"
        let barItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor.black), style: .plain, target: self, action: #selector(popView))
        self.navigationItem.leftBarButtonItem = barItem
        
    }
    
    @objc func popView() {
        navigationController?.popViewController(animated: true)
    }
}
