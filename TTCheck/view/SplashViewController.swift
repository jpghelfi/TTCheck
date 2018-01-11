//
//  SplashViewController.swift
//  TTCheck
//
//  Created by Juan Pablo on 11/26/17.
//  Copyright © 2017 Juan Pablo. All rights reserved.
//

import UIKit
import Lottie
import Flurry_iOS_SDK

class SplashViewController: UIViewController {

    var label: UILabel!
    
    var lottie: LOTAnimationView!
    
    fileprivate func setupViews() {
        
        self.view.backgroundColor = UIColor.getRedColor()
        
        self.label = UILabel()
        self.label.textColor = .white
        self.label.text = "ttcheck"
        self.label.font = UIFont.systemFont(ofSize: 40)
        self.view.addSubview(self.label)
        
        self.lottie = LOTAnimationView(name: "done")
        self.view.addSubview(lottie)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupViews()
    
        self.setupConstraints()
        
        self.showLottie()
        
        Flurry.logEvent("splash");
    }
    
    private func showLottie(){

        self.lottie.play{ (finished) in
            
            Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.splashTimeOut(sender:)), userInfo: nil, repeats: false)
        }
        
    }
    
    @objc func splashTimeOut(sender : Timer){
        let vc = HomeTableViewController()
        let nav = UINavigationController(rootViewController: vc);
        AppDelegate.sharedInstance().window?.rootViewController = nav
        AppDelegate.sharedInstance().window?.makeKeyAndVisible()
    }
    
    private func setupConstraints() {
        
        self.label.autoCenterInSuperview()
        
        self.lottie.autoPinEdge(.top, to: .bottom, of: self.label)
        self.lottie.autoAlignAxis(.vertical, toSameAxisOf: self.view)
        self.lottie.autoSetDimension(.height, toSize: 150)
        self.lottie.autoSetDimension(.width, toSize: 150)
        self.lottie.contentMode = .scaleAspectFill

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
