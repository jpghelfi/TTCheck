//
//  HomeTableViewCell.swift
//  TTCheck
//
//  Created by Juan Pablo on 11/19/17.
//  Copyright © 2017 Juan Pablo. All rights reserved.
//

import UIKit
import PureLayout

class HomeTableViewCell: UITableViewCell {

    var apiNameLabel: UILabel!
    
    var statusContainer: UIView!
    
    var statusLabel: UILabel!
    
    var lastTimeCheckedLabel: UILabel!
    
    
    
    
    func setupCell( api: ApiDTO){
        
        self.apiNameLabel = UILabel()
        self.apiNameLabel.text = api.apiName
        self.apiNameLabel.font = UIFont.systemFont(ofSize: 20)
        self.apiNameLabel.textColor = .black
        self.addSubview(self.apiNameLabel)
        
        self.statusContainer = UIView()
        self.addSubview(self.statusContainer)
        
        self.statusLabel = UILabel()
        self.statusLabel.text = api.apiStatus?.statusText
        self.statusLabel.textColor = api.getBackgorundColor()
        self.statusLabel.font = UIFont.systemFont(ofSize: 21)
        self.statusContainer.addSubview(self.statusLabel)
        
        self.lastTimeCheckedLabel = UILabel()
        self.lastTimeCheckedLabel.text = api.lastTimeCheck
        self.lastTimeCheckedLabel.font = UIFont.systemFont(ofSize: 10)
        self.lastTimeCheckedLabel.textColor = .black
        self.addSubview(self.lastTimeCheckedLabel)
        
        self.isUserInteractionEnabled = false
        self.setupConstraints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.apiNameLabel.text = nil
        self.statusLabel.text = nil
        self.lastTimeCheckedLabel.text = nil
    }
    
    private func setupConstraints() -> Void {
        self.apiNameLabel.autoPinEdge(.left, to: .left, of: self, withOffset: 10)
        self.apiNameLabel.autoAlignAxis(.horizontal, toSameAxisOf: self)
        
        self.statusContainer.autoPinEdge(.top, to: .top, of: self)
        self.statusContainer.autoPinEdge(.bottom, to: .bottom, of: self)
        self.statusContainer.autoPinEdge(.left, to: .right, of: self.apiNameLabel, withOffset: 180)
        self.statusContainer.autoPinEdge(.right, to: .right, of: self, withOffset: -10)
        
        self.statusLabel.autoAlignAxis(.horizontal, toSameAxisOf: self.statusContainer)
        self.statusLabel.autoPinEdge(.right, to: .right, of: self.statusContainer)
        
        self.lastTimeCheckedLabel.autoPinEdge(.left, to: .left, of: self, withOffset: 10)

        self.lastTimeCheckedLabel.autoPinEdge(.bottom, to: .bottom, of: self, withOffset: -10)
    }
}
