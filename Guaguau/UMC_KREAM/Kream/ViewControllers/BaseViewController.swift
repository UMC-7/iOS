//
//  BaseViewController.swift
//  Kream
//
//  Created by 이은찬 on 10/7/24.
//

import UIKit

class BaseViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    
    
    private func setupTabBar() {
        self.tabBar.backgroundColor = .white
        self.tabBar.isTranslucent = false
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        homeVC.tabBarItem = UITabBarItem(title: "HOME", image: UIImage(named: "HOME"), tag: 1)
        
        let StyleVC = UINavigationController(rootViewController: StyleViewController())
        StyleVC.tabBarItem = UITabBarItem(title: "STYLE", image: UIImage(named: "STYLE"), tag: 2)
        
        let ShopVC = UINavigationController(rootViewController: ShopViewController())
        ShopVC.tabBarItem = UITabBarItem(title: "SHOP", image: UIImage(named: "SHOP"), tag: 3)
        
        let SavedVC = UINavigationController(rootViewController: SavedViewController())
        SavedVC.tabBarItem = UITabBarItem(title: "SAVED", image: UIImage(named: "SAVED"), tag: 4)
        
        let MyVC = UINavigationController(rootViewController: MyPageViewController())
        MyVC.tabBarItem = UITabBarItem(title: "MY", image: UIImage(named: "MY"), tag: 5)
        
        self.viewControllers = [homeVC, StyleVC, ShopVC, SavedVC, MyVC]
        
    }
}
