//
//  BaseViewController.swift
//  Kream
//
//  Created by 권용빈 on 10/3/24.
//

import UIKit
class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 첫번째 탭 (Home ViewController)
        let homeVC = HomeViewController()
        let homeTabBarItem = UITabBarItem(title: "HOME", image: UIImage(named: "icon_home_fill"), tag: 0)
        homeVC.tabBarItem = homeTabBarItem
        
        // 두번째 탭 (Style ViewController)
        let styleVC = StyleViewController()
        let styleTabBarItem = UITabBarItem(title: "STYLE", image: UIImage(named: "styleLogo"), tag: 1)
        styleVC.tabBarItem = styleTabBarItem
        
        // 세번째 탭 (Shop ViewController)
        let shopVC = ShopViewController()
        let shopTabBarItem = UITabBarItem(title: "SHOP", image: UIImage(named: "shopLogo"), tag: 2)
        shopVC.tabBarItem = shopTabBarItem
        
        // 네번째 탭 (Saved ViewController)
        let savedVC = SavedViewController()
        let savedTabBarItem = UITabBarItem(title: "SAVED", image: UIImage(named: "savedLogo"), tag: 3)
        savedVC.tabBarItem = savedTabBarItem
        
        // 다섯번째 탭 (My ViewController)
        let myPageVC = UINavigationController(rootViewController: MyPageViewController())
        let myPageTabBarItem = UITabBarItem(title: "MY", image: UIImage(named: "person"), tag: 4)
        myPageVC.tabBarItem = myPageTabBarItem

        self.viewControllers = [homeVC, styleVC, shopVC, savedVC, myPageVC]
        
    }
}
