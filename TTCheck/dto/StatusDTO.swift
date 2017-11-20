//
//  StatusDTO.swift
//  TTCheck
//
//  Created by Juan Pablo on 11/19/17.
//  Copyright © 2017 Juan Pablo. All rights reserved.
//

import Foundation
import UIKit

class StatusDTO {
    
    private var isLive: Bool?
    var statusText: String?
    var color: UIColor?
    
    init(status: Bool) {
        
        self.isLive = status
        self.setColor()
    }
    
    private func setColor(){
        if let live = isLive{
            
            if live{
                self.statusText = "OK"
//                self.color = UIColor(hexString: "#d1ffdd")
                self.color = .green
            }else{
                
                self.statusText = "ERROR"
//                self.color = UIColor(hexString: "ff85a2")
                self.color = .red
            }
        }
    }
    
    
}
