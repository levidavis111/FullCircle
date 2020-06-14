//
//  FCNavigationController.swift
//  FullCircle
//
//  Created by Sunni Tang on 6/14/20.
//  Copyright © 2020 FullCircle. All rights reserved.
//

import UIKit

class FCNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        styleNavBar()
    

    }
    
    private func styleNavBar() {
        navigationBar.tintColor = FCDesign.lightBlue
        navigationBar.barTintColor = FCDesign.darkBlue
        let textAttributes = [
            NSAttributedString.Key.foregroundColor : FCDesign.lightGrey,
            NSAttributedString.Key.font : FCDesign.headerFont!] as [NSAttributedString.Key : Any]
        navigationBar.titleTextAttributes = textAttributes
        navigationBar.isTranslucent = false
        
    }
}
