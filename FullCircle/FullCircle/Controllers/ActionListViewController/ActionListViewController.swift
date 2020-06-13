//
//  ActionListViewController.swift
//  FullCircle
//
//  Created by Sunni Tang on 6/12/20.
//  Copyright © 2020 FullCircle. All rights reserved.
//

import UIKit

class ActionListViewController: UIViewController {

    /*
     - Icons for action types to filter through actions (tags)
     - What org (ex: BLM NY)
     - Type of action (colored label? icon. ex: Telephone icon)
     - Name of action (ex: "Call Rep Thomas") - save extended description for DVC
     */
    
    //MARK: - UI Objects
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        return searchBar
    }()
    
    //TODO: Update temporary icons
    lazy var easyButton: UIButton = {
        let button = UIButton()
        button.imageView?.image = UIImage(named: "1.circle")
        return button
    }()
    
    lazy var mediumButton: UIButton = {
        let button = UIButton()
        button.imageView?.image = UIImage(named: "2.circle")
        return button
    }()
    
    lazy var hardButton: UIButton = {
        let button = UIButton()
        button.imageView?.image = UIImage(named: "3.circle")
        return button
    }()
    
    lazy var difficultyButtonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [easyButton, mediumButton, hardButton])
        stackView.alignment = .center
        stackView.axis = .horizontal
        return stackView
    }()
    
    lazy var actionListTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    //MARK: - Internal Properties
//    var actions = [Action]()
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
//        addSubviews()
//        addConstraints()
        
    }
    


}
