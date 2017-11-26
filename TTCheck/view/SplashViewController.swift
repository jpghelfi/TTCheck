//
//  SplashViewController.swift
//  TTCheck
//
//  Created by Juan Pablo on 11/26/17.
//  Copyright © 2017 Juan Pablo. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.getRedColor()
        Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(self.splashTimeOut(sender:)), userInfo: nil, repeats: false)
        // Do any additional setup after loading the view.
    }
    
    @objc func splashTimeOut(sender : Timer){
        let vc = HomeTableViewController()
        AppDelegate.sharedInstance().window?.rootViewController = vc
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
