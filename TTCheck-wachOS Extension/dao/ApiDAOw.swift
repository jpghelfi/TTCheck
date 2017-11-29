//
//  ApiDAO.swift
//  TTCheck-wachOS Extension
//
//  Created by Juan Pablo on 11/28/17.
//  Copyright © 2017 Juan Pablo. All rights reserved.
//

import Foundation
import Alamofire


class ApiDAOw: TTGenericDAO {
    
    let baseURL = "https://api.uptimerobot.com/v2/getMonitors"
    let apiKey = "u517083-c94c552b912c91bd57e6c152"
    
    func getApiStatus( completion: @escaping ([ApiDTOw]) -> Void) {
        
        var monitorArray = [ApiDTOw]()
        var headers: [String:String] = [:]
        headers["api_key"] = apiKey
        
        Alamofire.request(baseURL, method: .post, parameters: headers, encoding: JSONEncoding.default, headers: nil).responseJSON {
            
            (response) in
            
            if let dic = response.value as? [String:AnyObject], let monitors = dic["monitors"] as? [[String:AnyObject]]{
                
                for monitor in monitors{
                    if let aMonitor = ApiDTOw(dictionary: monitor){
                        monitorArray.append(aMonitor)
                    }
                }
                completion(monitorArray)
            }
        }
    }
}
