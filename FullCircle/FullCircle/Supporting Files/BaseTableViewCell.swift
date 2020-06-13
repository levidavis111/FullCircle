//
//  BaseTableViewCell.swift
//  FullCircle
//
//  Created by Aishat Olowoshile on 6/13/20.
//  Copyright © 2020 FullCircle. All rights reserved.
//

import UIKit
import CellDataCoupler

class BaseTableViewCell<T>: ReusableCell<T> {
    var selectionColor: UIColor?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        selectionColor = .none
    }
}
