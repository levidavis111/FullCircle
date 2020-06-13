//
//  ActionListViewController+Buttons.swift
//  FullCircle
//
//  Created by Sunni Tang on 6/13/20.
//  Copyright © 2020 FullCircle. All rights reserved.
//

import UIKit

extension ActionListViewController {
    @objc func levelButtonPressed(button: UIButton) {
        switch button.tag {
        case 0:
            actions = Action.allActions
        case 1:
            actions = Action.allActions.filter { $0.type == .easy }
        case 2:
            actions = Action.allActions.filter { $0.type == .medium }
        case 3:
            actions = Action.allActions.filter { $0.type == .hard }
        default:
            break
        }
    }
    
}
