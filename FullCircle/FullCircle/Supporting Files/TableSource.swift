//
//  TableSource.swift
//  FullCircle
//
//  Created by Aishat Olowoshile on 6/13/20.
//  Copyright © 2020 FullCircle. All rights reserved.
//

import Foundation

import CellDataCoupler

protocol TableDelegate: class {
}

class TableSource: CouplerTableSource {
    
    weak var delegate: TableDelegate?
    
    init(with tableView: UITableView, delegate: TableDelegate? = nil) {
        super.init(with: tableView)
        self.delegate = delegate

        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.separatorStyle = .none
    }
}
