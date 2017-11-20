//
//  ApiDAO.swift
//  TTCheck
//
//  Created by Juan Pablo on 11/20/17.
//  Copyright © 2017 Juan Pablo. All rights reserved.
//

import Foundation
import Alamofire

class ApiDAO {
    
    let baseURL = "https://api.uptimerobot.com/v2/getMonitors"
    let apiKey = "m779668826-963324b37c14e6091936e959"
    
    func getApiStatus( completion: @escaping ([ApiDTO]) -> Void) {
        
        var headers: [String:String] = [:]
        headers["api_key"] = apiKey
        
        Alamofire.request(baseURL, method: .post, parameters: headers, encoding: JSONEncoding.default, headers: nil).responseJSON {
            
            (response) in
        
            if let dic = response.value as? [String:AnyObject], let status = dic["stat"] as? String{
                
                let _ = status
            }
        }
    }
}

//func getMovies(page: String, genreID: NSNumber, completion: @escaping ([Movie]) -> Void){
//

//    Alamofire.request(moviesList, parameters: paramDic).responseJSON(completionHandler: {
//
//        myResponse in
//
//        var moviesList: [Movie] = []
//
//        if let dictionary = myResponse.value as? [String: AnyObject],
//            let movies = dictionary[keyDictionary] as? [[String:AnyObject]]{
//
//            for movieDictionary in movies{
//                if let movie = Movie(dictionary: movieDictionary){
//                    moviesList.append(movie)
//                }
//            }
//            completion(moviesList)
//        }
//    })
//}
//
