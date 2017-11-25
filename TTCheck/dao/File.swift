//
//  File.swift
//  TTCheck
//
//  Created by Juan Pablo on 11/25/17.
//  Copyright © 2017 Juan Pablo. All rights reserved.
//

import Foundation
import TTMVC

class NewMonitorDAO: TTGenericDAO {
    
    
    func createNewMonitorWith(name: String, url: String, type: NSNumber = 1, completion: (NewMonitorDTO) -> ()){
    
        let monitorName = ["friendly_name":name]
        let monitorUrl = ["url":url]
        let monitorType = ["type":type]
        
        let dictionary = [monitorName,monitorUrl,monitorType]
        var newMonitorDTO = NewMonitorDTO(dictionary: dictionary)
        
        
        completion(newMonitorDTO)
    
    }
    
}
