//
//  BaseViewController.swift
//  Kream
//
//  Created by 이은찬 on 10/7/24.
//

import UIKit

class BaseViewController: UITabBarController {
    
    private let homeVC = HomeViewController()
    private let styleVC = StyleViewController()
    private let shopVC = ShopViewController()
    private let savedVC = SavedViewController()
    private let myVC = MyViewController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        homeVC.tabBarItem = UITabBarItem(title: "HOME", image: UIImage(named: "HOME"), tag: 0)
        styleVC.tabBarItem = UITabBarItem(title: "STYLE", image: UIImage(named: "STYLE"), tag: 1)
        shopVC.tabBarItem = UITabBarItem(title: "SHOP", image: UIImage(named: "SHOP"), tag: 2)
        savedVC.tabBarItem = UITabBarItem(title: "SAVED", image: UIImage(named: "SAVED"), tag: 3)
        myVC.tabBarItem = UITabBarItem(title: "MY", image: UIImage(named: "MY"), tag: 4)
        
        self.viewControllers = [homeVC, styleVC, shopVC, savedVC, myVC]
        
    }
}
