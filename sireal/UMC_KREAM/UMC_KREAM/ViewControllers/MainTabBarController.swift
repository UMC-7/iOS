//
//  MainViewController.swift
//  UMC_KREAM
//
//  Created by 윤시진 on 10/7/24.
//

import UIKit

// 하단 탭 구성
class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        
        self.selectedIndex = 0
    }
    
    private func setupTabBar() {
        // 각 탭의 ViewController 생성
        let homeVC = UIViewController()
        let styleVC = UIViewController()
        let shopVC = UIViewController()
        let savedVC = UIViewController()
        
        
        // MyPageViewController는 UINavigationController로 감
        let mypageVC = MyPageViewController()
        let myPageNavController = UINavigationController(rootViewController: mypageVC)
        
        
        // Tab Bar에 추가할 ViewController와 탭 설정
        homeVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "home"), selectedImage: UIImage(named: "homeIcon_selected"))
        styleVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "style"), selectedImage: UIImage(named: "styleIcon_selected"))
        shopVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "shop"), selectedImage: UIImage(named: "shopIcon_selected"))
        savedVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "saved"), selectedImage: UIImage(named: "savedIcon_selected"))
        
        myPageNavController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "mypage"), selectedImage: UIImage(named: "mypageIcon_selected"))
        

        viewControllers = [homeVC, styleVC, shopVC, savedVC, myPageNavController]
        
        tabBar.items?.forEach { item in
                    item.imageInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
                }
    }
        
}
    


