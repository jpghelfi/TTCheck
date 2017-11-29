//
//  ApiDTO.swift
//  TTCheck-wachOS Extension
//
//  Created by Juan Pablo on 11/28/17.
//  Copyright © 2017 Juan Pablo. All rights reserved.
//

import Foundation
import UIKit

class ApiDTOw: TTGenericDTO{
    
    var id: NSNumber?
    var apiName: String?
    var apiStatus: StatusDTOw?
    var lastTimeCheck: String?
    
    func getBackgorundColor() -> UIColor? {
        return apiStatus?.color
    }
    
    override func loadFromDictionary(_ dictionary: [String : AnyObject]) {
        //        super.loadFromDictionary(dictionary)
        
        if let theId = dictionary["id"] as? NSNumber{
            self.id = theId
        }
        
        self.apiName = dictionary["friendly_name"] as? String
        if let status = dictionary["status"] as? NSNumber{
            self.apiStatus = StatusDTOw(statusNumber: status)
        }
        
        if let date = dictionary["create_datetime"] as? NSNumber {
            self.lastTimeCheck = self.transformDateFromUnix(unixDate: date)
        }
    }
    
    private func transformDateFromUnix(unixDate: NSNumber) -> String {
        return String(describing: Date(timeIntervalSince1970: TimeInterval(truncating: unixDate)))
    }

    
}
