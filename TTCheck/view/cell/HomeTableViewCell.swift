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
        if let status = self.statusLabel{
            self.addSubview(status)
            
        }
        
        self.lastTimeCheckedLabel = UILabel()
        self.lastTimeCheckedLabel?.text = api.lastTimeCheck
        self.lastTimeCheckedLabel?.textColor = .black
        if let last = self.lastTimeCheckedLabel{
            self.addSubview(last)
            
        }
        self.backgroundColor = api.getBackgorundColor()
        
        self.setupConstraints()
    }
    
    private func setupConstraints() -> Void {
        self.apiNameLabel?.autoPinEdge(.left, to: .left, of: self)
        
        
        self.statusLabel?.autoPinEdge(.left, to: .left, of: self)
        
        if let name = self.apiNameLabel{
            self.statusLabel?.autoPinEdge(.top, to: .bottom, of: name)
            self.lastTimeCheckedLabel?.autoPinEdge(.bottom, to: .bottom, of: self)
        }
    }
}
