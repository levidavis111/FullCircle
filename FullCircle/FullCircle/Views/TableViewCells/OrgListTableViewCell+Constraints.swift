//
//  OrgListTableViewCell+Constraints.swift
//  FullCircle
//
//  Created by Sunni Tang on 6/13/20.
//  Copyright © 2020 FullCircle. All rights reserved.
//

import UIKit

extension OrgListTableViewCell {
    func addSubviews() {
        self.addSubview(orgLogoImageView)
        self.addSubview(orgNameLabel)
        self.addSubview(orgDetailLabel)
    }
    
    func addConstraints() {
        setOrgLogoImageViewConstraints()
        setOrgNameLabelConstraints()
        setOrgDetailLabelConstraints()
    }
    
    private func setOrgLogoImageViewConstraints() {
        orgLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            orgLogoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            orgLogoImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            orgLogoImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8),
            orgLogoImageView.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8)
        ])
    }
    
    private func setOrgNameLabelConstraints() {
        orgNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            orgNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            orgNameLabel.rightAnchor.constraint(equalTo: orgLogoImageView.leftAnchor, constant: -10),
            orgNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            orgNameLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6)
        ])
    }
    
    private func setOrgDetailLabelConstraints() {
        orgDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            orgDetailLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            orgDetailLabel.rightAnchor.constraint(equalTo: orgLogoImageView.leftAnchor, constant: -10),
            orgDetailLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            orgDetailLabel.topAnchor.constraint(equalTo: orgNameLabel.bottomAnchor, constant: 5),
        ])
    }
    
}
