//
//  OrgDetailViewController.swift
//  FullCircle
//
//  Created by Aishat Olowoshile on 6/13/20.
//  Copyright © 2020 FullCircle. All rights reserved.
//

import UIKit
import MapKit
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
        tableView.backgroundColor = .white
    }
    
    func setupTableSource() {
        tableSource = TableSource(with: tableView)
        tableView.register(ActionListTableViewCell.self, forCellReuseIdentifier: "actionListCell")
    }
    
    func refreshUI() {
        displayItem(self.organization)
    }
}



extension OrgDetailViewController {
    func displayItem(_ organization: Organization) {
        var couplers = [BaseCellCoupler]()
        
        //Logo
        let orgLogo = OrgDetailImageCellData(image: organization.logoString)
        let orgLogoCell = CellCoupler(OrgDetailImageCell.self, orgLogo)
        couplers.append(orgLogoCell)
        
        //Name & Description
        let orgNameAndDescrip = OrgDetailCellInfo(title: organization.name, description: organization.description)
        let orgNameAndDescripCell = CellCoupler(OrgDetailCell.self, orgNameAndDescrip)
        couplers.append(orgNameAndDescripCell)
        
        //Donate
        let donateToOrgInfo = OrgDetailButtonCellData(donationLink: organization.donateURL)
        let buttonActioncell = CellCoupler(OrgDetailButtonCell.self, donateToOrgInfo)
        couplers.append(buttonActioncell)
        
        //Subtitle
        let orgActionTitleInfo = OrgDetailActionListCellData(title: "Contact Us")
        let orgActionTitleCell = CellCoupler(OrgDetailActionListCell.self, orgActionTitleInfo)
         couplers.append(orgActionTitleCell)
        
        
        //Contact
        let orgCoordinates = getCoordinates(forAddress: organization.address)
        let orgContactInfo = OrgDetailContactCellData(phoneInfo: organization.phone, emailInfo: organization.email, linkInfo: organization.website, locationCoordinates: orgCoordinates)
        let orgContactInfoCell = CellCoupler(OrgDetailContactCell.self, orgContactInfo)
        couplers.append(orgContactInfoCell)
        
        //Subtitle
        let orgActionSubTitleInfo = OrgDetailActionListCellData(title: "Available Actions")
        let orgActionSubTitleCell = CellCoupler(OrgDetailActionListCell.self, orgActionSubTitleInfo)
        couplers.append(orgActionSubTitleCell)
       
        
        //Actions
        for action in organization.actions {
            //Action
            let actionListCell = tableView.dequeueReusableCell(withIdentifier: "actionListCell") as! ActionListTableViewCell
            
            actionListCell.actionNameLabel.text = action.name
            actionListCell.orgNameLabel.text = action.organization.name
            
            //TODO: Update image based on action type
            actionListCell.actionTypeImageView.image = UIImage(named: action.organization.logoString)!
            
            switch action.isSaved {
            case true:
                actionListCell.saveActionButton.setBackgroundImage(UIImage(systemName: "star.circle.fill"), for: .normal)
            default:
                actionListCell.saveActionButton.setBackgroundImage(UIImage(systemName: "star.circle"), for: .normal)
            }
            
            actionListCell.saveAction = {
                let index = allActions.firstIndex(where: { $0.name == action.name } )
                allActions[index!].isSaved = allActions[index!].isSaved ? false : true
                print("saved button pressed for \(allActions[index!].name). Currently saved: \(allActions[index!].isSaved)")
                
                //            do {
                //                let savedActions = try ActionPersistenceManager.manager.getSavedActions()
                //
                //                if let index = savedActions.firstIndex(where: { $0.name == action.name }) {
                //                    try ActionPersistenceManager.manager.deleteAction(actions: savedActions, at: index)
                //                } else {
                //                    try ActionPersistenceManager.manager.saveAction(action: action)
                //                }
                //            } catch {
                //                print(error)
                //            }
            }
            
            //couplers.append(BaseCellCoupler(cellType: actionListCell))
        }
        
        tableSource?.set(couplers: couplers)
    }
}

extension OrgDetailViewController {
    func getCoordinates(forAddress address: String) -> CLLocationCoordinate2D? {
        let geocoder = CLGeocoder()
        var coordinates: CLLocationCoordinate2D?
        geocoder.geocodeAddressString(address) { (placemarks, error) in
            guard error == nil else {
                print("Geocoding error: \(error!)")
                return
            }
            coordinates = placemarks?.first?.location?.coordinate
        }
        return coordinates
    }
}

