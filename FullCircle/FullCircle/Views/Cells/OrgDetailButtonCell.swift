//
//  OrgDetailButtonCell.swift
//  FullCircle
//
//  Created by Aishat Olowoshile on 6/14/20.
//  Copyright © 2020 FullCircle. All rights reserved.
//

import UIKit

struct OrgDetailButtonCellData {
    let param1: String
    let param2: Int
}

class OrgDetailButtonCell: BaseTableViewCell<OrgDetailButtonCellData> {
    
    @IBOutlet weak var actionButton: UIButton!
    
    override func setup() {
        //TODO Set up the cell
    }
}
