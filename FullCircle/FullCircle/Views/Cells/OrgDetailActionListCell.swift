//
//  OrgDetailActionListCell.swift
//  FullCircle
//
//  Created by Aishat Olowoshile on 6/14/20.
//  Copyright © 2020 FullCircle. All rights reserved.
//

import UIKit

struct OrgDetailActionListCellData {
    let title: String?
}

class OrgDetailActionListCell: BaseTableViewCell<OrgDetailActionListCellData> {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func setup() {
        titleLabel.text = info?.title ?? ""
    }
}

