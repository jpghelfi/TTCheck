//
//  ApiDTO.swift
//  TTCheck
//
//  Created by Juan Pablo on 11/19/17.
//  Copyright © 2017 Juan Pablo. All rights reserved.
//

import Foundation
import UIKit


class ApiDTO {
    
    var apiName: String?
    var apiStatus: StatusDTO?
    var lastTimeCheck: String?
    
    func getBackgorundColor() -> UIColor? {
        
        return apiStatus?.color
    }
    
}
