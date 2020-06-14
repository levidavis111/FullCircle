//
//  ActionListTableViewCell.swift
//  FullCircle
//
//  Created by Sunni Tang on 6/13/20.
//  Copyright © 2020 FullCircle. All rights reserved.
//

import UIKit

class ActionListTableViewCell: UITableViewCell {
    
    //MARK: - UI Objects
    let actionNameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .green
        label.numberOfLines = 0
        return label
    }()
    
    let orgNameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .yellow
        label.numberOfLines = 0
        return label
    }()

    //TODO: Add image logos for action type i.e. telephone or email
    lazy var actionTypeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    //TODO: Place temp image
    lazy var saveActionButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(saveActionButtonPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    //TODO: Add Follow button for users
    
    var saveAction: (() -> ())?
    
    //MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Cell Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    @objc func saveActionButtonPressed(_ sender: UIButton) {
        // Take care of persisting saved actions here
        if let closure = self.saveAction {
            closure()
            if saveActionButton.backgroundImage(for: .normal) == UIImage(systemName: "star.circle") {
                saveActionButton.setBackgroundImage(UIImage(systemName: "star.circle.fill"), for: .normal)
            } else {
                saveActionButton.setBackgroundImage(UIImage(systemName: "star.circle"), for: .normal)
            }
        }
    }
}
