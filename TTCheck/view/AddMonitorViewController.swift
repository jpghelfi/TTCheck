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

protocol DidSaveMonitor {
    func didSaverMonitor() -> NewMonitorDTO
}

class AddMonitorViewController: UIViewController {

    var nameContainerView: UIView!
    
    var urlContainerView: UIView!
    
    var monitorNameLabel: UILabel!

    var monitorNameTextField: UITextField!
    
    var monitorURLLabel: UILabel!
    
    var monitorURLTextField: UITextField!
    
    var monitorTypeLabel: UILabel!
    
    var monitorType: UITextField!
    
    var saveButton: UIButton!
    
    var delegate: DidSaveMonitor?
    
    var newMonitorDTO: NewMonitorDTO?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupViews()
        
        self.fillViews()
        
        self.setupConstraints()

    }
    
    private func setupViews(){
        
        self.view.backgroundColor = UIColor.getLightGrayColor()
        
        self.nameContainerView = UIView()
        self.nameContainerView.backgroundColor = UIColor.getDarkGrayColor()
        self.nameContainerView.layer.cornerRadius = 5
        self.view.addSubview(self.nameContainerView)
        
        self.monitorNameLabel = UILabel()
        self.monitorNameLabel.text = NSLocalizedString("Monitor Name", comment: "")
        self.monitorNameLabel.textColor = .white
        self.monitorNameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        self.nameContainerView.addSubview(self.monitorNameLabel)
        
        self.monitorNameTextField = UITextField()
        self.monitorNameTextField.textColor = .black
        self.monitorNameTextField.backgroundColor = .white
        self.monitorNameTextField.font = UIFont.systemFont(ofSize: 20)
        self.monitorNameTextField.layer.cornerRadius = 5
        self.nameContainerView.addSubview(self.monitorNameTextField)
        
        self.urlContainerView = UIView()
        self.urlContainerView.backgroundColor = UIColor.getDarkGrayColor()
        self.urlContainerView.layer.cornerRadius = 10
        self.view.addSubview(self.urlContainerView)
        
        self.monitorURLLabel = UILabel()
        self.monitorURLLabel.text = NSLocalizedString("Monitor URL", comment: "")
        self.monitorURLLabel.textColor = .white
        self.monitorURLLabel.font = UIFont.boldSystemFont(ofSize: 20)
        self.urlContainerView.addSubview(self.monitorURLLabel)
        
        self.monitorURLTextField = UITextField()
        self.monitorURLTextField.textColor = .black
        self.monitorURLTextField.backgroundColor = .white
        self.monitorURLTextField.font = UIFont.systemFont(ofSize: 20)
        self.monitorURLTextField.layer.cornerRadius = 10
        self.urlContainerView.addSubview(self.monitorURLTextField)
        
//        self.monitorTypeLabel = UILabel()
//        self.monitorTypeLabel.text = NSLocalizedString("Monitor Name", comment: "")
//        self.monitorTypeLabel.textColor = .white
//        self.monitorTypeLabel.font = UIFont.boldSystemFont(ofSize: 14)
//
//        self.monitorType = UITextField()
//        self.monitorType.textColor = .white
//        self.monitorType.font = UIFont.systemFont(ofSize: 14)
        
        self.saveButton = UIButton()
        self.saveButton.backgroundColor = UIColor.getRedColor()
        let title = NSLocalizedString("SAVE", comment: "")
        self.saveButton.setTitle( title, for: .normal)
        self.saveButton.titleLabel?.textColor = .white
        self.saveButton.layer.cornerRadius = 10
        self.saveButton.addTarget(self, action: #selector(didTouchButton), for: .touchUpInside)
        self.view.addSubview(self.saveButton)
    }
    
    @objc private func didTouchButton(sender: UIButton){
        
        let newMonitorService = NewMonitorService()
        newMonitorService.createNewMonitorWith(name: self.monitorNameTextField.text!, url: self.monitorURLTextField.text!) { () in
            
//            self.newMonitorDTO = response
            
        }
    }
    
    private func fillViews(){
        
    }
    
    private func setupConstraints(){
        
        self.nameContainerView.autoPinEdge(.top, to: .top, of: self.view, withOffset: 84)
        self.nameContainerView.autoSetDimension(.height, toSize: 150)
        self.nameContainerView.autoPinEdge(.left, to: .left, of: self.view, withOffset: 20)
        self.nameContainerView.autoPinEdge(.right, to: .right, of: self.view, withOffset: -20)
        
        self.urlContainerView.autoPinEdge(.top, to: .bottom, of: self.nameContainerView, withOffset: 15)
        self.urlContainerView.autoMatch(.height, to: .height, of: self.nameContainerView)
        self.urlContainerView.autoPinEdge(.left, to: .left, of: self.view, withOffset: 20)
        self.urlContainerView.autoPinEdge(.right, to: .right, of: self.view, withOffset: -30)
        
        self.monitorNameLabel.autoPinEdge(.top, to: .top, of: self.nameContainerView, withOffset: 15)
        self.monitorNameLabel.autoPinEdge(.left, to: .left, of: self.nameContainerView, withOffset: 10)
        
        self.monitorNameTextField.autoPinEdge(.top, to: .bottom, of: self.monitorNameLabel, withOffset: 15)
        self.monitorNameTextField.autoMatch(.height, to: .height, of: self.monitorNameLabel)
        self.monitorNameTextField.autoPinEdge(.left, to: .left, of: self.nameContainerView, withOffset: 10)
        self.monitorNameTextField.autoMatch(.width, to: .width, of: self.nameContainerView, withOffset: -20)
        
        self.monitorURLLabel.autoPinEdge(.top, to: .top, of: self.urlContainerView, withOffset: 5)
        self.monitorURLLabel.autoPinEdge(.left, to: .left, of: self.urlContainerView, withOffset: 10)
        
        self.monitorURLTextField.autoPinEdge(.top, to: .bottom, of: self.monitorURLLabel, withOffset: 15)
        self.monitorURLTextField.autoPinEdge(.left, to: .left, of: self.urlContainerView, withOffset: 10)
        self.monitorURLTextField.autoMatch(.height, to: .height, of: self.monitorURLLabel)
        self.monitorURLTextField.autoMatch(.width, to: .width, of: self.urlContainerView, withOffset: -30)
        
        self.saveButton.autoPinEdge(.top, to: .bottom, of: self.urlContainerView, withOffset: 15)
        self.saveButton.autoAlignAxis(.vertical, toSameAxisOf: self.view)
        self.saveButton.autoSetDimension(.height, toSize: 64)
        self.saveButton.autoSetDimension(.width, toSize: 122)
    
    }

    
    
    
    
    
    
    
    
    
    
    
    
}
