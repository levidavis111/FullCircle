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
    private let padding: CGFloat = 10.0
    private lazy var imagePath = UIBezierPath(rect: activityTypeIconView.frame)
    
    private lazy var orgLogoView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: self.action.organization.logoString)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var orgNameLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var activityTypeIconView: UIImageView = {
        let iconView = UIImageView()
        iconView.image = UIImage(named: self.action.iconString)
        return iconView
    }()
    
    private lazy var descriptionTextView: UITextView = {
        let textView = UITextView()
        
        return textView
    }()
    
    private lazy var takeActionButton: UIButton = {
        let button = UIButton()
        button.setTitle("Take Action", for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(takeActionButtonPressed), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        constrainSubviews()
        setExclusionPath()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setExclusionPath()
    }
    
    @objc private func takeActionButtonPressed() {
        
    }
    
    private func setExclusionPath() {
        DispatchQueue.main.async {
            self.descriptionTextView.textContainer.exclusionPaths = [self.imagePath]
            self.view.layoutIfNeeded()
        }
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
        constrainActivityTypeIconView()
        constrainTakeActionButton()
    }
    
    private func constrainOrgLogoView() {
        orgLogoView.translatesAutoresizingMaskIntoConstraints = false
        [orgLogoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
         orgLogoView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
         orgLogoView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding), orgLogoView.heightAnchor.constraint(equalToConstant: 150)].forEach {$0.isActive = true}
        
    }
    private func constrainOrgNameLabel() {
        orgNameLabel.translatesAutoresizingMaskIntoConstraints = false
        [orgNameLabel.topAnchor.constraint(equalTo: orgLogoView.bottomAnchor, constant: padding),
         orgNameLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)].forEach {$0.isActive = true}
    }
    
    private func constrainDescriptionTextView() {
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        [descriptionTextView.topAnchor.constraint(equalTo: orgNameLabel.bottomAnchor, constant: padding),
         descriptionTextView.bottomAnchor.constraint(equalTo: takeActionButton.topAnchor, constant: -padding),
         descriptionTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding), descriptionTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding)].forEach {$0.isActive = true}
    }
    
    private func constrainActivityTypeIconView() {
        activityTypeIconView.translatesAutoresizingMaskIntoConstraints = false
        [activityTypeIconView.topAnchor.constraint(equalTo: descriptionTextView.topAnchor),
         activityTypeIconView.trailingAnchor.constraint(equalTo: descriptionTextView.trailingAnchor),
         activityTypeIconView.heightAnchor.constraint(equalToConstant: 30)].forEach {$0.isActive = true}
    }
    
    private func constrainTakeActionButton() {
        takeActionButton.translatesAutoresizingMaskIntoConstraints = false
        [takeActionButton.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: padding),
         takeActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: (2 * padding)),
         takeActionButton.heightAnchor.constraint(equalToConstant: 30),
         takeActionButton.widthAnchor.constraint(equalToConstant: 60)].forEach {$0.isActive = true}
    }

}
