//
//  ApiDTO.swift
//  TTCheck
//
//  Created by Juan Pablo on 11/19/17.
//  Copyright © 2017 Juan Pablo. All rights reserved.
//

//{
//    "id": 779668826,
//    "friendly_name": "facebook",
//    "url": "https://www.facebook.com/platform/api-status/",
//    "type": 1,
//    "sub_type": "",
//    "keyword_type": "",
//    "keyword_value": "",
//    "http_username": "",
//    "http_password": "",
//    "port": "",
//    "interval": 300,
//    "status": 2,
//    "create_datetime": 1511201631
//},

import Foundation
import UIKit
import TTMVC

class ApiDTO: TTGenericDTO {
    
    var apiName: String?
    var apiStatus: StatusDTO?
    var lastTimeCheck: String?
    
    func getBackgorundColor() -> UIColor? {
        return apiStatus?.color
    }
    
    override func loadFromDictionary(_ dictionary: [String : AnyObject]) {
        super.loadFromDictionary(dictionary)
        
        self.apiName = dictionary["friendly_name"] as? String
        if let status = dictionary["status"] as? NSNumber{
            self.apiStatus = StatusDTO(statusNumber: status)
        }
        
        if let date = dictionary["create_datetime"] as? NSNumber {
            self.lastTimeCheck = self.transformDateFromUnix(unixDate: date)
        }
    }
    
    private func transformDateFromUnix(unixDate: NSNumber) -> String {
        return String(describing: Date(timeIntervalSince1970: TimeInterval(truncating: unixDate)))
    }

    
    
}
