//
//  OrgDetailImageCell.swift
//  FullCircle
//
//  Created by Aishat Olowoshile on 6/14/20.
//  Copyright © 2020 FullCircle. All rights reserved.
//

import UIKit

struct OrgDetailImageCellData {
    let image: String?
}

class OrgDetailImageCell: BaseTableViewCell<OrgDetailImageCellData> {
    
    @IBOutlet weak var orgImageView: UIImageView!
    
    override func setup() {
        guard let logo = info?.image else { return }
        orgImageView.image = UIImage(named: logo)
    }
}
