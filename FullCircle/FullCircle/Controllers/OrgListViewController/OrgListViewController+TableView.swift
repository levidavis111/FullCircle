//
//  OrgListViewController+TableView.swift
//  FullCircle
//
//  Created by Sunni Tang on 6/13/20.
//  Copyright © 2020 FullCircle. All rights reserved.
//

import UIKit

extension OrgListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return organizations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orgListCell", for: indexPath) as! OrgListTableViewCell
        let organization = organizations[indexPath.row]
        
        cell.orgNameLabel.text = organization.name.uppercased()
        cell.orgDetailLabel.text = "\(organization.borough.rawValue)   \(organization.type)"
        cell.orgLogoImageView.image = UIImage(named: organization.logoString)
        
        return cell
    }
    
}

extension OrgListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
