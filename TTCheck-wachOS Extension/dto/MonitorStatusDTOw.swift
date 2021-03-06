//
//  MonitorStatusDTOw.swift
//  TTCheck-wachOS Extension
//
//  Created by Juan Pablo on 11/28/17.
//  Copyright © 2017 Juan Pablo. All rights reserved.
//

import Foundation

class MonitorStatusDTO: TTGenericDTO {
    
    var status: String?
    
    init(status: String) {
        super.init()
        self.status = status
    }
    
    func isMonitorSaved() -> Bool {
        
        return self.status == "ok"
    }
    
    required init?(dictionary: [String : AnyObject]) {
        fatalError("init(dictionary:) has not been implemented")
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
}
