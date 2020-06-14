//
//  FCCellView.swift
//  FullCircle
//
//  Created by Sunni Tang on 6/14/20.
//  Copyright © 2020 FullCircle. All rights reserved.
//

import UIKit

class FCCellView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        addShadowToView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addShadowToView() {
        let shadowOffset = CGSize(width: 2, height: 2)
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = FCDesign.medGrey.cgColor
        self.layer.masksToBounds = true
        
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.layer.cornerRadius).cgPath
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowRadius = 20
        self.layer.shadowOpacity = 1
        self.layer.masksToBounds = false
        self.layer.shadowColor = FCDesign.medGrey.cgColor
        self.layer.shadowPath = shadowPath
        self.layoutIfNeeded()
    }

}
