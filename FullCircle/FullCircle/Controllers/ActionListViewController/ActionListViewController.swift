//
//  ActionListViewController.swift
//  FullCircle
//
//  Created by Sunni Tang on 6/12/20.
//  Copyright © 2020 FullCircle. All rights reserved.
//

import UIKit

class ActionListViewController: UIViewController {
    
    //MARK: - UI Objects
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        return searchBar
    }()
    
    lazy var levelLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose level of engagement"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    //TODO: Update temporary icons
    lazy var allButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "a.circle"), for: .normal)
        button.setImage(UIImage(systemName: "a.circle.fill"), for: .selected)
        button.tintColor = .black
        return button
    }()
    
    lazy var easyButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "1.circle"), for: .normal)
        button.setImage(UIImage(systemName: "1.circle.fill"), for: .selected)
        button.tintColor = .black
        return button
    }()
    
    lazy var mediumButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "2.circle"), for: .normal)
        button.setImage(UIImage(systemName: "2.circle.fill"), for: .selected)
        button.tintColor = .black
        return button
    }()
    
    lazy var hardButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "3.circle"), for: .normal)
        button.setImage(UIImage(systemName: "3.circle.fill"), for: .selected)
        button.tintColor = .black
        return button
    }()
    
    lazy var difficultyButtonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [allButton, easyButton, mediumButton, hardButton])
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    lazy var actionListTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ActionListTableViewCell.self, forCellReuseIdentifier: "actionListCell")
        return tableView
    }()
    
    //MARK: - Internal Properties
//    var actions = [Action]()
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        addSubviews()
        addConstraints()
        
    }
    


}
