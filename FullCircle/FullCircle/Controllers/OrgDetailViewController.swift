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
    }
    
    //Setup
    func setupUI() {
        
    }
    
    func setupTableSource() {
        tableSource = TableSource(with: tableView)
    }
}

extension OrgDetailViewController {
    func displayItem() {
        var sections = [CellCouplerSection]()
        
        var couplers = [BaseCellCoupler]()
        let info = OrgDetailCellInfo(title: "Example")
        let coupler = CellCoupler(OrgDetailCell.self, info, didSelect: { [weak self] (_) in
            // TODO: Handle selection
        })
        couplers.append(coupler)
        sections.append(CellCouplerSection(couplers: couplers))
        
        tableSource?.set(sections: sections)
    }
}

