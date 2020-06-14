//
//  HomeTabBarController.swift
//  FullCircle
//
//  Created by Sunni Tang on 6/12/20.
//  Copyright © 2020 FullCircle. All rights reserved.
//

import UIKit

class HomeTabBarController: UITabBarController {

    // MARK: - Internal Properties
    var actionListVC = ActionListViewController()
    var orgListVC = OrgListViewController()
    var profileVC = ProfileViewController()
    lazy var controllers = [actionListVC, orgListVC, profileVC]
    
    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // NOTE: Temporary Icons & Titles
        actionListVC.tabBarItem = UITabBarItem(title: "Actions", image: UIImage(systemName: "star.circle"), tag: 0)
        orgListVC.tabBarItem = UITabBarItem(title: "Organizations", image: UIImage(systemName: "circle.grid.hex"), tag: 1)
        profileVC.tabBarItem = UITabBarItem(title: "My Actions", image: UIImage(systemName: "person.circle"), tag: 3)
        
        self.viewControllers = controllers
        self.viewControllers = controllers.map { FCNavigationController(rootViewController: $0)}
        
        styleTabBar()
    }

    
    private func styleTabBar() {
        tabBar.barTintColor = FCDesign.lightGrey
        tabBar.tintColor = FCDesign.darkBlue
        tabBar.unselectedItemTintColor = FCDesign.lightBlue
        tabBar.isTranslucent = false
      }


}
