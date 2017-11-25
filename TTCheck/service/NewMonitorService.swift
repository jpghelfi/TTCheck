//
//  NewMonitorService.swift
//  TTCheck
//
//  Created by Juan Pablo on 11/25/17.
//  Copyright © 2017 Juan Pablo. All rights reserved.
//

import Foundation
import TTMVC

class NewMonitorService: TTGenericService {
    
    func createNewMonitorWith(name: String, url: String, type: NSNumber = 1, completion: @escaping (NewMonitorStatusDTO) -> ()){
    
        let newMonitorDAO = NewMonitorDAO()
        newMonitorDAO.createNewMonitorWith(name: name, url: url) { (response) in
            
            completion(response)
        }
        
    }
    
    
}
