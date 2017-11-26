//
//  NewMonitorService.swift
//  TTCheck
//
//  Created by Juan Pablo on 11/25/17.
//  Copyright © 2017 Juan Pablo. All rights reserved.
//

import Foundation
import TTMVC

class MonitorService: TTGenericService {
    
    func createNewMonitorWith(name: String, url: String, type: NSNumber = 1, completion: @escaping (MonitorStatusDTO) -> ()){
    
        let newMonitorDAO = MonitorDAO()
        newMonitorDAO.createNewMonitorWith(name: name, url: url) { (response) in
            
            completion(response)
        }
        
    }
    
    func deleteMonitorWith(id: String, completion: @escaping (MonitorStatusDTO) -> ()){
        
        let deleteMonitor = MonitorDAO()
        deleteMonitor.deleteMonitorWith(id: id) { (response) in
            
            completion(response)
        }
    }
    
    
}
