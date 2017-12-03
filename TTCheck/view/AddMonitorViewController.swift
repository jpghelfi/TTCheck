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

class AddMonitorViewController: UIViewController, UITextInputTraits {

    
    var closeButton: UIButton!
    
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
        self.nameContainerView.layer.cornerRadius = 10
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
        self.monitorNameTextField.textAlignment = .left
        self.monitorNameTextField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)

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
        self.monitorURLTextField.text = "http://"
        self.monitorURLTextField.textColor = .black
        self.monitorURLTextField.backgroundColor = .white
        self.monitorURLTextField.font = UIFont.systemFont(ofSize: 20)
        self.monitorURLTextField.layer.cornerRadius = 5
        self.monitorURLTextField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        self.urlContainerView.addSubview(self.monitorURLTextField)
        
        self.closeButton = UIButton()
        self.closeButton.backgroundColor = UIColor.getLightGrayColor()
        self.closeButton.setImage(UIImage(named: "close"), for: .normal)
        self.closeButton.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        self.view.addSubview(self.closeButton)
        
        self.saveButton = UIButton()
        self.saveButton.backgroundColor = UIColor.getRedColor()
        let title = NSLocalizedString("SAVE", comment: "")
        self.saveButton.setTitle( title, for: .normal)
        self.saveButton.titleLabel?.textColor = .white
        self.saveButton.layer.cornerRadius = 10
        self.saveButton.addTarget(self, action: #selector(didTouchButton), for: .touchUpInside)
        self.view.addSubview(self.saveButton)
    }
     @objc private func dismiss(sender: UIButton){
        self.dismiss(animated: true) {
            
        }
    }
    
    
    @objc private func didTouchButton(sender: UIButton){
        
        let newMonitorService = MonitorService()
        newMonitorService.createNewMonitorWith(name: self.monitorNameTextField.text!, url: self.monitorURLTextField.text!) { (NewMonitorStatusDTO) in
            
            self.checkStatus(newMonitorStatus: NewMonitorStatusDTO)
            
        }
    }
    
    private func checkStatus(newMonitorStatus: MonitorStatusDTO){
        
        if newMonitorStatus.isMonitorSaved(){
            
            self.dismiss(animated: true, completion: {
            })
        }else{
            let myAlert = UIAlertController(title: NSLocalizedString("Sorry", comment: ""), message: NSLocalizedString("Sorry again", comment: ""), preferredStyle: .actionSheet)
            
            myAlert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .`default`, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            
            present(myAlert, animated: true, completion: {
            })
        }
        
    }
    
    private func fillViews(){
        
    }
    
    private func setupConstraints(){
        
        self.closeButton.autoPinEdge(.top, to: .top, of: self.view, withOffset: 40)
        self.closeButton.autoPinEdge(.right, to: .right, of: self.view, withOffset: -20)
        self.closeButton.autoSetDimensions(to: CGSize(width: 36, height: 36))
        
        self.nameContainerView.autoPinEdge(.top, to: .top, of: self.view, withOffset: 84)
        self.nameContainerView.autoSetDimension(.height, toSize: 150)
        self.nameContainerView.autoPinEdge(.left, to: .left, of: self.view, withOffset: 20)
        self.nameContainerView.autoPinEdge(.right, to: .right, of: self.view, withOffset: -20)
        
        self.urlContainerView.autoPinEdge(.top, to: .bottom, of: self.nameContainerView, withOffset: 15)
        self.urlContainerView.autoMatch(.height, to: .height, of: self.nameContainerView)
        self.urlContainerView.autoPinEdge(.left, to: .left, of: self.view, withOffset: 20)
        self.urlContainerView.autoPinEdge(.right, to: .right, of: self.view, withOffset: -20)
        
        self.monitorNameLabel.autoPinEdge(.top, to: .top, of: self.nameContainerView, withOffset: 15)
        self.monitorNameLabel.autoPinEdge(.left, to: .left, of: self.nameContainerView, withOffset: 10)
        
        self.monitorNameTextField.autoPinEdge(.top, to: .bottom, of: self.monitorNameLabel, withOffset: 15)
        self.monitorNameTextField.autoSetDimension(.height, toSize: 40)
        self.monitorNameTextField.autoPinEdge(.left, to: .left, of: self.nameContainerView, withOffset: 10)
        self.monitorNameTextField.autoMatch(.width, to: .width, of: self.nameContainerView, withOffset: -20)
        
        self.monitorURLLabel.autoPinEdge(.top, to: .top, of: self.urlContainerView, withOffset: 15)
        self.monitorURLLabel.autoPinEdge(.left, to: .left, of: self.urlContainerView, withOffset: 10)
        
        self.monitorURLTextField.autoPinEdge(.top, to: .bottom, of: self.monitorURLLabel, withOffset: 15)
        self.monitorURLTextField.autoPinEdge(.left, to: .left, of: self.urlContainerView, withOffset: 10)
        self.monitorURLTextField.autoMatch(.height, to: .height, of: self.monitorNameTextField)
        self.monitorURLTextField.autoMatch(.width, to: .width, of: self.urlContainerView, withOffset: -20)
        
        self.saveButton.autoPinEdge(.top, to: .bottom, of: self.urlContainerView, withOffset: 15)
        self.saveButton.autoAlignAxis(.vertical, toSameAxisOf: self.view)
        self.saveButton.autoSetDimension(.height, toSize: 64)
        self.saveButton.autoSetDimension(.width, toSize: 122)
    
    }

    
    
    
}
