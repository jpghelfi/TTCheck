//
//  service.swift
//  TTCheck-wachOS Extension
//
//  Created by Juan Pablo on 11/28/17.
//  Copyright © 2017 Juan Pablo. All rights reserved.
//

import Foundation

class ApiServicew: TTGenericService {
    
    func getApiStatus( completion: @escaping ([ApiDTOw]) -> Void) {
        let dao = ApiDAOw()
        dao.getApiStatus { (response) in
            completion(response)
        }
    }
}
