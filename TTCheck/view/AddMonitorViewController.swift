//
//  AddMonitorViewController.swift
//  TTCheck
//
//  Created by Juan Pablo on 11/25/17.
//  Copyright © 2017 Juan Pablo. All rights reserved.
//

import UIKit

//api_key - required
//friendly_name - required
//url - required
//type - required
//sub_type - optional (required for port monitoring)
//port - optional (required for port monitoring)
//keyword_type - optional (required for keyword monitoring)
//keyword_value - optional (required for keyword monitoring)
//interval - optional (in seconds)
//http_username - optional
//http_password - optional

class AddMonitorViewController: UIViewController {

    var containerView: UIView!
    
    var monitorNameLabel: UILabel!
    var monitorNameTextField: UITextField!
    
    var monitorURLLabel: UILabel!
    var monitorURLTextField: UITextField!
    
    var monitorTypeLabel: UILabel!
    var monitorType: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupViews()
        
        self.fillViews()
        
        self.setupConstraints()
        

    }
    
    private func setupViews(){
        
        self.view.backgroundColor = UIColor.getLightGrayColor()
        
        self.containerView = UIView()
        self.containerView.backgroundColor = UIColor.getDarkGrayColor()
        self.view.addSubview(self.containerView)
        
        self.monitorNameLabel = UILabel()
        self.monitorNameLabel.text = NSLocalizedString("Monitor Name", comment: "")
        self.monitorNameLabel.textColor = .white
        self.monitorNameLabel.font = UIFont.boldSystemFont(ofSize: 14)
        self.containerView.addSubview(self.monitorNameLabel)
        
        self.monitorNameTextField = UITextField()
        self.monitorNameTextField.textColor = .white
        self.monitorNameTextField.backgroundColor = UIColor.getLightGrayColor()
        self.monitorNameTextField.font = UIFont.systemFont(ofSize: 14)
        self.containerView.addSubview(self.monitorNameTextField)
        
        self.monitorURLLabel = UILabel()
        self.monitorURLLabel.text = NSLocalizedString("Monitor URL", comment: "")
        self.monitorURLLabel.textColor = .white
        self.monitorURLLabel.font = UIFont.boldSystemFont(ofSize: 14)
        self.containerView.addSubview(self.monitorURLLabel)
        
        self.monitorURLTextField = UITextField()
        self.monitorURLTextField.textColor = .white
        self.monitorURLTextField.backgroundColor = UIColor.getLightGrayColor()
        self.monitorURLTextField.font = UIFont.systemFont(ofSize: 14)
        self.containerView.addSubview(self.monitorURLTextField)
        
//        self.monitorTypeLabel = UILabel()
//        self.monitorTypeLabel.text = NSLocalizedString("Monitor Name", comment: "")
//        self.monitorTypeLabel.textColor = .white
//        self.monitorTypeLabel.font = UIFont.boldSystemFont(ofSize: 14)
//
//        self.monitorType = UITextField()
//        self.monitorType.textColor = .white
//        self.monitorType.font = UIFont.systemFont(ofSize: 14)
    }
    
    private func fillViews(){
        
    }
    
    private func setupConstraints(){
        
        self.containerView.autoPinEdge(.top, to: .top, of: self.view, withOffset: 70)
        self.containerView.autoPinEdge(.bottom, to: .bottom, of: self.view, withOffset: -70)
        self.containerView.autoPinEdge(.left, to: .left, of: self.view, withOffset: 20)
        self.containerView.autoPinEdge(.right, to: .right, of: self.view, withOffset: -20)
        
        self.monitorNameLabel.autoPinEdge(.top, to: .top, of: self.containerView, withOffset: 15)
        self.monitorNameLabel.autoPinEdge(.left, to: .left, of: self.containerView, withOffset: 10)
        
        self.monitorNameTextField.autoPinEdge(.top, to: .top, of: self.containerView, withOffset: 15)
        self.monitorNameTextField.autoPinEdge(.left, to: .right, of: self.monitorNameLabel, withOffset: 5)
        self.monitorNameTextField.autoMatch(.height, to: .height, of: self.monitorNameLabel)
        self.monitorNameTextField.autoPinEdge(.right, to: .right, of: self.containerView, withOffset: -5)
        
        self.monitorURLLabel.autoPinEdge(.top, to: .bottom, of: self.monitorNameLabel, withOffset: 5)
        self.monitorURLLabel.autoPinEdge(.left, to: .left, of: self.containerView, withOffset: 10)
        
        self.monitorURLTextField.autoPinEdge(.top, to: .bottom, of: self.monitorNameTextField, withOffset: 5)
        self.monitorURLTextField.autoPinEdge(.left, to: .right, of: self.monitorURLLabel, withOffset: 5)
        self.monitorURLTextField.autoMatch(.height, to: .height, of: self.monitorURLLabel)
        self.monitorURLTextField.autoPinEdge(.right, to: .right, of: self.containerView, withOffset: -5)
    
    }

    
    
    
    
    
    
    
    
    
    
    
    
}
