//
//  BaseViewController.swift
//  practice_2
//
//  Created by 권용빈 on 10/1/24.
//

import UIKit

class BaseViewController: UITabBarController {
    private let modalVC = ModalViewController()
    private let navigationVC = UINavigationController(rootViewController: NavigationViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        modalVC.tabBarItem = UITabBarItem(title: "modalVC", image: UIImage(systemName: "paperplane.fill"), tag: 0)
        navigationVC.tabBarItem = UITabBarItem(title: "navigationVC", image: UIImage(systemName: "tray.fill"), tag: 1)
        
        self.viewControllers = [modalVC, navigationVC]

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
