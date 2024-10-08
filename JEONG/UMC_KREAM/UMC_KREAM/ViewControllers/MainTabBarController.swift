//
//  MainTabBarController.swift
//  UMC_KREAM
//
//  Created by 정의찬 on 10/8/24.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
        appearance()
    }
    

    private func setupTabBar() {
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        homeVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Home"), tag: 1)
        
        let StyleVC = UINavigationController(rootViewController: StyleViewController())
        StyleVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Style"), tag: 2)
        
        let ShopVC = UINavigationController(rootViewController: ShopViewController())
        ShopVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Shop.pdf"), tag: 3)
        
        let SavedVC = UINavigationController(rootViewController: SavedViewController())
        SavedVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Saved.pdf"), tag: 4)
        
        let MyVC = UINavigationController(rootViewController: MyPageViewController())
        MyVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "My.pdf"), tag: 5)
        
        self.viewControllers = [homeVC, StyleVC, ShopVC, SavedVC, MyVC]
        
    }
    
    private func appearance() {
        let barAppearance = UITabBarAppearance()
        barAppearance.stackedLayoutAppearance.selected.iconColor = UIColor.black
        barAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.black]
        barAppearance.stackedLayoutAppearance.selected.badgeBackgroundColor = UIColor.black
        barAppearance.stackedLayoutAppearance.normal.badgeBackgroundColor = UIColor.black
        
        self.tabBar.standardAppearance = barAppearance
        self.tabBar.backgroundColor = .clear
    }
           

}
