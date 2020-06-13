//
//  ActionDetailViewController.swift
//  FullCircle
//
//  Created by Sunni Tang on 6/12/20.
//  Copyright © 2020 FullCircle. All rights reserved.
//

import UIKit

class ActionDetailViewController: UIViewController {
    
    var action: Action!
    
    private lazy var orgLogoView: UIImageView = {[weak self] in
        let imageView = UIImageView()
        imageView.image = UIImage(named: self?.action.organization.logoString)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var orgNameLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var activityTypeIconView: UIImageView = {[weak self] in
        let iconView = UIImageView()
        iconView.image = UIImage(named: self?.action.iconString)
        return iconView
    }()
    
    private lazy var descriptionTextView: UITextView = {
        let textView = UITextView()
        
        return textView
    }()
    
    private lazy var takeActionButton: UIButton = {
        let button = UIButton()
        button.setTitle("Take Action", for: .normal)
        button.addTarget(self, action: #selector(takeActionButtonPressed), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        constrainSubviews()
    }
    
    @objc private func takeActionButtonPressed() {
        
    }
    
    private func addSubviews() {
        view.addSubview(orgLogoView)
        view.addSubview(orgNameLabel)
        view.addSubview(descriptionTextView)
        descriptionTextView.addSubview(activityTypeIconView)
        view.addSubview(takeActionButton)
    }
    
    private func constrainSubviews() {
        constrainOrgLogoView()
        constrainOrgNameLabel()
        constrainDescriptionTextView()
        constrainTakeActionButton()
    }
    
    private func constrainOrgLogoView() {
        orgLogoView.translatesAutoresizingMaskIntoConstraints = false
    }
    private func constrainOrgNameLabel() {
        orgLogoView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func constrainDescriptionTextView() {
        orgLogoView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func constrainTakeActionButton() {
        orgLogoView.translatesAutoresizingMaskIntoConstraints = false
    }

}
