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

    var apiNameLabel: UILabel?
    var statusLabel: UILabel?
    var lastTimeCheckedLabel: UILabel?
    
    func setupCell( api: ApiDTO){
        
        self.apiNameLabel = UILabel()
        self.apiNameLabel?.text = api.apiName
        self.apiNameLabel?.textColor = .black
        if let name = apiNameLabel{
            self.addSubview(name)
            
        }
        
        self.statusLabel = UILabel()
        self.statusLabel?.text = api.apiStatus?.statusText
        self.statusLabel?.textColor = .black
        self.statusLabel?.backgroundColor = api.getBackgorundColor()
        if let status = self.statusLabel{
            self.addSubview(status)
            
        }
        
        self.lastTimeCheckedLabel = UILabel()
        self.lastTimeCheckedLabel?.text = api.lastTimeCheck
        self.lastTimeCheckedLabel?.textColor = .black
        if let last = self.lastTimeCheckedLabel{
            self.addSubview(last)
            
        }
//        self.backgroundColor = api.getBackgorundColor()
        
        self.setupConstraints()
    }
    
    private func setupConstraints() -> Void {
        self.apiNameLabel?.autoPinEdge(.left, to: .left, of: self, withOffset: 10)
        self.apiNameLabel?.autoPinEdge(.top, to: .top, of: self, withOffset: 10)
        
        self.statusLabel?.autoPinEdge(.right, to: .right, of: self, withOffset: -10)
        self.statusLabel?.autoPinEdge(.top, to: .top, of: self, withOffset: 10)
        
        self.lastTimeCheckedLabel?.autoPinEdge(.left, to: .left, of: self, withOffset: 10)
        
        if let status = self.statusLabel{
            self.lastTimeCheckedLabel?.autoPinEdge(.top, to: .bottom, of: status, withOffset: 10)
        }
    }
}
