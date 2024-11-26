//
//  MainTabBarController.swift
//  UMC_KREAM
//
//  Created by 윤시진 on 11/19/24.
//

import UIKit

/// KREAM 탭바컨트롤러
class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
        appearance()
    }
    
    
    private func setupTabBar() {
        self.tabBar.backgroundColor = .white
        self.tabBar.isTranslucent = false
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        homeVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Home"), tag: 1)
        
        let StyleVC = UINavigationController(rootViewController: StyleViewController())
        StyleVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Style"), tag: 2)
        
        let ShopVC = UINavigationController(rootViewController: ShopViewController())
        ShopVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Shop"), tag: 3)
        
        let SavedVC = UINavigationController(rootViewController: SavedViewController())
        SavedVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Saved"), tag: 4)
        
        let MyVC = UINavigationController(rootViewController: MyPageViewController())
        MyVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "My"), tag: 5)
        
        self.viewControllers = [homeVC, StyleVC, ShopVC, SavedVC, MyVC]
        
    }
    
    private func appearance() {
        let barAppearance = UITabBarAppearance()

        // 선택된 아이템 색상 설정 (검정색)
        barAppearance.stackedLayoutAppearance.selected.iconColor = UIColor.black
        barAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.black]

        // 탭바 Appearance 설정
        self.tabBar.standardAppearance = barAppearance
        self.tabBar.scrollEdgeAppearance = barAppearance
        
        // 배경색 및 투명도
        self.tabBar.backgroundColor = .white
        self.tabBar.isTranslucent = false
    }

           

}
