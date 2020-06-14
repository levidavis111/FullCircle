//
//  ProfileViewController.swift
//  FullCircle
//
//  Created by Sunni Tang on 6/13/20.
//  Copyright © 2020 FullCircle. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    //MARK: - UI Objects
    lazy var searchBar = FCSearchBar()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "User4BlackLives"
        label.numberOfLines = 0
        return label
    }()
    
    lazy var userInfoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    lazy var actionListTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ActionListTableViewCell.self, forCellReuseIdentifier: "actionListCell")
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    //MARK: - Internal Properties
    var savedActions = allActions.filter { $0.isSaved == true } {
        didSet {
            actionListTableView.reloadData()
        }
    }
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = FCDesign.medGrey
        addSubviews()
        addConstraints()
        
        title = "FullCircle"

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        actionListTableView.reloadData()
        updateUserInfoLabel()

    }
    
    func updateUserInfoLabel() {
        savedActions = allActions.filter { $0.isSaved == true }
        userInfoLabel.text = """
        Saved actions: \(savedActions.count)
        Actions taken: 0
        """
    }
}
