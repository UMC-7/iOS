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
    
    /// 네비게이션 바의 상단 화면으로 나가는 버튼 + 네비게이션 타이틀 지정
    private func setNavigation() {
        self.navigationItem.title = "프로필 관리"
        
        let backBtn = UIBarButtonItem(image: UIImage(systemName: "arrow.left")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor.black), style: .plain, target: self, action: #selector(didTap))
        navigationItem.leftBarButtonItem = backBtn
    }
    
    /// 네비게이션 왼쪽 상단 버튼을 통해 이전 화면으로 돌아감
    @objc func didTap() {
        navigationController?.popViewController(animated: true)
    }
}
