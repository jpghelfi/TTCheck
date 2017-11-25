//
//  AddMonitorTableViewCell.swift
//  TTCheck
//
//  Created by Juan Pablo on 11/25/17.
//  Copyright © 2017 Juan Pablo. All rights reserved.
//

import UIKit

class AddMonitorTableViewCell: UITableViewCell {

    var containerView: UIView!
    
    var addMonitorLabel: UILabel!
    
    var addImageView: UIImageView!
    
    func setupCell(){
        
        self.backgroundColor = UIColor.getLightGrayColor()
        
        self.containerView = UIView()
        self.containerView.backgroundColor = UIColor.getDarkGrayColor()
        self.containerView.layer.cornerRadius = 10
        self.addSubview(self.containerView)
        
        self.addMonitorLabel = UILabel()
        self.addMonitorLabel.text = NSLocalizedString("Add API", comment: "")
        self.addMonitorLabel.textColor = UIColor.getLightGrayColor()
        self.addMonitorLabel.font = UIFont.boldSystemFont(ofSize: 18)
        self.containerView.addSubview(self.addMonitorLabel)
        
        self.addImageView = UIImageView()
        self.addImageView.image = UIImage.init(named: "addButton")
        self.containerView.addSubview(self.addImageView)
        
        self.selectionStyle = .none
        self.setupConstraints()
        
    }
    
    private func setupConstraints() -> Void {
        
        self.containerView.autoPinEdge(.top, to: .top, of: self, withOffset: 10)
        self.containerView.autoPinEdge(.bottom, to: .bottom, of: self, withOffset: -10)
        self.containerView.autoPinEdge(.left, to: .left, of: self, withOffset: 10)
        self.containerView.autoPinEdge(.right, to: .right, of: self, withOffset: -10)
        
        self.addMonitorLabel.autoPinEdge(.bottom, to: .bottom, of: self.containerView, withOffset: -10)
        self.addMonitorLabel.autoAlignAxis(.vertical, toSameAxisOf: self.containerView)
        
        self.addImageView.autoPinEdge(.bottom, to: .top, of: self.addMonitorLabel, withOffset: -10)
        self.addImageView.autoSetDimension(.height, toSize: 40)
        self.addImageView.autoSetDimension(.width, toSize: 40)
        self.addImageView.autoAlignAxis(.vertical, toSameAxisOf: self.containerView)
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
