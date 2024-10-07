//
//  MyPageViewController.swift
//  UMC_KREAM
//
//  Created by 윤시진 on 10/7/24.
//

import UIKit

class MyPageViewController: UIViewController {
    
    // MyPageView 사용
    private lazy var myPageView: MyPageView = {
        let view = MyPageView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = myPageView
        setupActions()
    }
    
    private func setupActions() {
        myPageView.settingsButton.addTarget(self, action: #selector(settingsTapped), for: .touchUpInside)
        myPageView.cameraButton.addTarget(self, action: #selector(cameraTapped), for: .touchUpInside)
        myPageView.manageProfileButton.addTarget(self, action: #selector(manageProfileTapped), for: .touchUpInside)
        myPageView.shareProfileButton.addTarget(self, action: #selector(shareProfileTapped), for: .touchUpInside)
    }

    
    // 설정 버튼 이벤트
    @objc private func settingsTapped() {
    
    }

    // 카메라 버튼 이벤트
    @objc private func cameraTapped() {
    
    }
    
    // 프로필 관리 버튼 이벤트
    @objc private func manageProfileTapped() {
        let profileEditVC = ProfileEditViewController()
        navigationController?.pushViewController(profileEditVC, animated: true)
    }
    
    // 프로필 공유 버튼 이벤트
    @objc private func shareProfileTapped() {
    
    }
    
    // 뒤로 가기 버튼 이벤트
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
