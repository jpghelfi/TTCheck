//
//  SplashViewController.swift
//  TTCheck
//
//  Created by Juan Pablo on 11/26/17.
//  Copyright © 2017 Juan Pablo. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.getRedColor()
        
        self.label = UILabel()
        self.label.textColor = .white
        self.label.text = "ttcheck"
        self.label.font = UIFont.systemFont(ofSize: 40)
        self.view.addSubview(self.label)
        
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.splashTimeOut(sender:)), userInfo: nil, repeats: false)
        // Do any additional setup after loading the view.
        
        setupConstraints()
    }
    
    @objc func splashTimeOut(sender : Timer){
        let vc = HomeTableViewController()
        let nav = UINavigationController(rootViewController: vc);
        AppDelegate.sharedInstance().window?.rootViewController = nav
        AppDelegate.sharedInstance().window?.makeKeyAndVisible()
    }
    
    private func setupConstraints() {
        self.label.autoCenterInSuperview()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
