//
//  FCSearchBar.swift
//  FullCircle
//
//  Created by Sunni Tang on 6/14/20.
//  Copyright © 2020 FullCircle. All rights reserved.
//

import UIKit

class FCSearchBar: UISearchBar {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.searchBarStyle = .minimal
        self.placeholder = "Begin typing to search..."
        
        self.backgroundColor = FCDesign.darkBlue
        self.searchTextField.font = FCDesign.bodyFont
        self.searchTextField.textColor = FCDesign.darkGrey
        self.tintColor = FCDesign.darkGrey
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
