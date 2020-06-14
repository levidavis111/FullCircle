//
//  OrgDetailViewController.swift
//  FullCircle
//
//  Created by Aishat Olowoshile on 6/13/20.
//  Copyright © 2020 FullCircle. All rights reserved.
//

import UIKit
import CellDataCoupler

class OrgDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var tableSource: TableSource?
    var organization: Organization!
    
    //Initializer
    static func create(_ organization: Organization) -> OrgDetailViewController {
        let vc = UIStoryboard(name: "OrgDetail", bundle: nil).instantiateViewController(withIdentifier: "OrgDetailViewController") as! OrgDetailViewController
        vc.organization = organization
        return vc
    }
    
    //Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableSource()
        refreshUI()
    }
    
    //Setup
    func setupUI() {
        
    }
    
    func setupTableSource() {
        tableSource = TableSource(with: tableView)
    }
    
    func refreshUI() {
        displayItem(self.organization)
    }
}



extension OrgDetailViewController {
    func displayItem(_ organization: Organization) {
        var sections = [CellCouplerSection]()
        
        var couplers = [BaseCellCoupler]()
        
        let  ordNameAndDescrip = OrgDetailCellInfo(title: "Example")
        let ordNameAndDescripCell = CellCoupler(OrgDetailCell.self, ordNameAndDescrip)
        couplers.append(ordNameAndDescripCell)
        
        let orgAction = OrgDetailCellInfo(title: "Example")
        let orgActionCell = CellCoupler(OrgDetailCell.self, orgAction, didSelect: { [weak self] (_) in
            // TODO: Handle selection
        })
        couplers.append(orgActionCell)
        
        let orgContactInfo = OrgDetailCellInfo(title: "Example")
        let orgContactInfoCell = CellCoupler(OrgDetailCell.self, orgContactInfo)
        couplers.append(orgContactInfoCell)
        
        
        let donateToOrgInfo = OrgDetailCellInfo(title: "Example")
        let buttonActioncell = CellCoupler(OrgDetailCell.self, donateToOrgInfo)
        couplers.append(buttonActioncell)
        
        sections.append(CellCouplerSection(couplers: couplers))
        
        tableSource?.set(sections: sections)
    }
}

