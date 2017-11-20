//
//  ApiService.swift
//  TTCheck
//
//  Created by Juan Pablo on 11/20/17.
//  Copyright © 2017 Juan Pablo. All rights reserved.
//

import Foundation
import TTMVC

class ApiService: TTGenericService {
    
    func getApiStatus( completion: @escaping ([ApiDTO]) -> Void) {
        let dao = ApiDAO()
        dao.getApiStatus { (response) in
            completion(response)
        }
    }
}
