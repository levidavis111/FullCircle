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
    // TODO: Add profileVC
    
    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        actionListVC.tabBarItem = UITabBarItem(title: "Actions", image: UIImage(systemName: "smallcircle.circle"), tag: 0)
        orgListVC.tabBarItem = UITabBarItem(title: "Organizations", image: UIImage(systemName: "person.3"), tag: 1)
        
        self.viewControllers = [actionListVC, orgListVC]
    }
    


}
