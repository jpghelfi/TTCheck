//
//  NewMonitorDTO.swift
//  TTCheck
//
//  Created by Juan Pablo on 11/25/17.
//  Copyright © 2017 Juan Pablo. All rights reserved.
//

import Foundation
import TTMVC

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


class NewMonitorDTO: TTGenericDTO {
    
    var friendly_name: String?
    var url: String?
    var type: NSNumber?
    
    
    
}
