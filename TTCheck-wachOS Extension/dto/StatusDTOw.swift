//
//  StatusDTOw.swift
//  TTCheck-wachOS Extension
//
//  Created by Juan Pablo on 11/28/17.
//  Copyright © 2017 Juan Pablo. All rights reserved.
//

import Foundation
import UIKit

class StatusDTOw: TTGenericDTO {
    
    var isLive: Bool?
    var statusText: String?
    var color: UIColor?
    
    init(status: Bool) {
        super.init()
        self.isLive = status
        self.setColor()
    }
    
    init(statusNumber: NSNumber) {
        super.init()
        self.isLive = setStatusValue(number: statusNumber)
        self.setColor()
    }
    
    private func setStatusValue(number: NSNumber) -> Bool{
        
        if number == 2{
            return true
        }else{
            return false
        }
    }
    
    required init?(dictionary: [String : AnyObject]) {
        fatalError("init(dictionary:) has not been implemented")
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
    private func setColor(){
        if let live = isLive{
            
            if live{
                self.statusText = "OK"
                self.color = .green
            }else{
                
                self.statusText = "ERROR"
                self.color = .red
            }
        }
    }
    
    
}
