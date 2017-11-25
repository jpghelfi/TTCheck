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
    
    var containerView: UIView!

    var apiNameLabel: UILabel!
    
    var statusContainer: UIView!
    
    var statusLabel: UILabel!
    
    var lastTimeCheckedLabel: UILabel!
    
    
    
    
    func setupCell( api: ApiDTO){
        
        self.backgroundColor = UIColor.getLightGrayColor()
        
        self.containerView = UIView()
        self.containerView.backgroundColor = UIColor.getRedColor()
        self.containerView.layer.cornerRadius = 10
        self.addSubview(self.containerView)
        
        self.apiNameLabel = UILabel()
        self.apiNameLabel.text = api.apiName
//        self.apiNameLabel.font = UIFont.systemFont(ofSize: 25)
        self.apiNameLabel.textColor = .white
        self.apiNameLabel.font = UIFont.boldSystemFont(ofSize: 25)
        self.containerView.addSubview(self.apiNameLabel)
        
        self.statusContainer = UIView()
        self.containerView.addSubview(self.statusContainer)
        
        self.statusLabel = UILabel()
        self.statusLabel.text = api.apiStatus?.statusText
        self.statusLabel.textColor = api.getBackgorundColor()
        self.statusLabel.font = UIFont.systemFont(ofSize: 21)
        self.statusContainer.addSubview(self.statusLabel)
        
        self.lastTimeCheckedLabel = UILabel()
        self.lastTimeCheckedLabel.text = api.lastTimeCheck
        self.lastTimeCheckedLabel.font = UIFont.systemFont(ofSize: 15)
        self.lastTimeCheckedLabel.textColor = UIColor.lightGray
        self.containerView.addSubview(self.lastTimeCheckedLabel)
        
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
        
        self.containerView.autoPinEdge(.top, to: .top, of: self, withOffset: 10)
        self.containerView.autoPinEdge(.bottom, to: .bottom, of: self, withOffset: -10)
        self.containerView.autoPinEdge(.left, to: .left, of: self, withOffset: 10)
        self.containerView.autoPinEdge(.right, to: .right, of: self, withOffset: -10)
        
        self.apiNameLabel.autoPinEdge(.left, to: .left, of: self.containerView, withOffset: 10)
        self.apiNameLabel.autoPinEdge(.top, to: .top, of: self.containerView, withOffset: 20)
        
        self.statusContainer.autoPinEdge(.top, to: .top, of: self.containerView)
        self.statusContainer.autoPinEdge(.bottom, to: .bottom, of: self.containerView)
        self.statusContainer.autoPinEdge(.left, to: .right, of: self.apiNameLabel, withOffset: 150)
        self.statusContainer.autoPinEdge(.right, to: .right, of: self.containerView, withOffset: -10)
        
        self.statusLabel.autoAlignAxis(.horizontal, toSameAxisOf: self.statusContainer)
        self.statusLabel.autoPinEdge(.right, to: .right, of: self.statusContainer)
        
        self.lastTimeCheckedLabel.autoPinEdge(.left, to: .left, of: self.containerView, withOffset: 10)

        self.lastTimeCheckedLabel.autoPinEdge(.bottom, to: .bottom, of: self.containerView, withOffset: -10)
    }
}
