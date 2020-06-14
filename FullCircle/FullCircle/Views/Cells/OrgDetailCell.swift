//
//  OrgDetailCell.swift
//  FullCircle
//
//  Created by Aishat Olowoshile on 6/13/20.
//  Copyright © 2020 FullCircle. All rights reserved.
//

import UIKit

struct OrgDetailCellInfo {
    var title: String?
    var description: String?
}

class OrgDetailCell: BaseTableViewCell<OrgDetailCellInfo> {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func setup() {
        titleLabel.text = info?.title
        descriptionLabel.text = info?.description
    }
}
