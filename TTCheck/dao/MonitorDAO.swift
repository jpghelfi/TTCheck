//
//  File.swift
//  TTCheck
//
//  Created by Juan Pablo on 11/25/17.
//  Copyright © 2017 Juan Pablo. All rights reserved.
//

import Foundation
import TTMVC
import Alamofire

class MonitorDAO: TTGenericDAO {
    
    let baseURL = "https://api.uptimerobot.com/v2/newMonitor"
    let apiKey = "u517083-c94c552b912c91bd57e6c152"
    
    func createNewMonitorWith(name: String, url: String, type: String = "1", completion: @escaping (MonitorStatusDTO) -> ()){
    
        var params: [String:String] = [:]
        params["api_key"] = apiKey
        params["friendly_name"] = name
        params["url"] = url
        params["type"] = type
        
        Alamofire.request(baseURL, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON {
            
            (myResponse) in
            
            if let dic = myResponse.value as? [String:AnyObject], let status = dic["stat"] as? String{
                
                let newStatus = MonitorStatusDTO(status: status)
                completion(newStatus)
            }
            
        }
    }
    
    func deleteMonitorWith(id: String, completion: @escaping (MonitorStatusDTO) -> ()){
        
        let url = "https://api.uptimerobot.com/v2/deleteMonitor"

        
        var params: [String:String] = [:]
        params["api_key"] = apiKey
        params["id"] = id
        
        Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON {
            
            (myResponse) in
            
            if let dic = myResponse.value as? [String:AnyObject], let status = dic["stat"] as? String{
                
                let newStatus = MonitorStatusDTO(status: status)
                completion(newStatus)
            }
            
        }
    }
    
}
