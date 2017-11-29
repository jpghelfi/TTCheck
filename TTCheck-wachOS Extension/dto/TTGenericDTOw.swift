//
//  TTGenericDTO.swift
//  Encuestas
//
//  Created by Mariano D'Agostino on 5/27/15.
//  Copyright (c) 2015 WOP. All rights reserved.
//

import UIKit
import Alamofire
import Foundation


extension NSObject{
    //returns the property type
    func getTypeOfProperty(name:String)->String? {
        let type: Mirror = Mirror(reflecting:self)
        for child in type.children {
            if child.label! == name
            {
                return String(describing: Swift.type(of: child.value))
            }
        }
        return nil
    }
    
    func getTypeOf(name:String)->Any.Type? {
        let type: Mirror = Mirror(reflecting:self)
        for child in type.children {
            if child.label! == name
            {
                return Swift.type(of: child.value)
            }
        }
        return nil
    }
    
}

open class TTGenericDTO: NSObject {
    
    open func loadFromDictionary(_ dictionary: [String: AnyObject]){
        let propertyNames = self.propertyNames()
        for key in dictionary.keys {
            if propertyNames.contains(key) {
                if let theValue = dictionary[key] {
                    if !(theValue is NSNull) {
                        self.setValue(theValue, forKey: key)
                    }
                }
            }
        }
    }
    
    func propertyNames() -> [String] {
        let mirrored_object = Mirror(reflecting: self)
        var result = [String]()
        for (_, attr) in mirrored_object.children.enumerated() {
            if let propertyName = attr.label as String! {
                result.append(propertyName)
            }
        }
        
        // This is an issue as it limits to one subclass 'deep'
        if let parent = mirrored_object.superclassMirror{
            for (_, attr) in parent.children.enumerated() {
                if let propertyName = attr.label as String!{
                    if !result.contains(propertyName) {
                        result.append(propertyName)
                    }
                }
            }
        }
        return result
    }
    
    override required public init() {
        super.init()
    }
    
    required public init?(dictionary: [String:AnyObject]) {
        super.init()
        self.loadFromDictionary(dictionary)
    }
    
}

open class TTGenericDAO: NSObject {
    
    public func callCollection<T: TTGenericDTO>(url: String!,
                                                method: HTTPMethod = .get,
                                                headers: [String: String]? = nil,
                                                parameters: [String: AnyObject]? = nil,
                                                debug: Bool = false,
                                                completionHandler: @escaping (_ result:TTResult<[T]>) -> Void) -> Void {
        
        var realHeaders = [String:String]()
        if let headers = headers {
            realHeaders.merge(with: headers)
        }
        Alamofire.request(url, method: method, parameters: parameters, headers: realHeaders)
            .responseString(completionHandler: { (result) in
                if debug, let value = result.result.value {
                    print(value)
                }
            })
            .responseJSON { (response) in
                let result = TTResult<[T]>()
                if let value = response.result.value as? [String: AnyObject] {
                    if let statusCode = response.response?.statusCode, statusCode >= 400 {
                        if let item = self.parseItem(value: value, type: TTError.self) {
                            result.error = item
                            completionHandler(result)
                            return
                        }
                    }
                }
                if let value = response.result.value as? [[String: AnyObject]] {
                    let results = self.parseCollection(value: value, type: T.self)
                    result.result = results
                    completionHandler(result)
                    return
                }
                completionHandler(result)
        }
    }
    
    public func call<T: TTGenericDTO>(url: String!,
                                      method: HTTPMethod = .get,
                                      headers: [String: String]? = nil,
                                      parameters: [String: AnyObject]? = nil,
                                      debug: Bool = false,
                                      completionHandler: @escaping (_ result:TTResult<T>) -> Void) -> Void {
        var realHeaders = [String:String]()
        if let headers = headers {
            realHeaders.merge(with: headers)
        }
        Alamofire.request(url, method: method, parameters: parameters, headers: realHeaders )
            .responseString(completionHandler: { (result) in
                if debug, let value = result.result.value {
                    print(value)
                }
            })
            .responseJSON { (response) in
                let result = TTResult<T>()
                if let value = response.result.value as? [String: AnyObject] {
                    if let statusCode = response.response?.statusCode, statusCode >= 400 {
                        if let item = self.parseItem(value: value, type: TTError.self) {
                            result.error = item
                            completionHandler(result)
                            return
                        }
                    }else{
                        if let item = self.parseItem(value: value, type: T.self) {
                            result.result = item
                            completionHandler(result)
                            return
                        }
                    }
                }
                completionHandler(result)
        }
    }
    
    internal func parseItem<T: TTGenericDTO>(value: [String: AnyObject]!, type: T.Type) -> T! {
        let item = T(dictionary: value)
        return item
    }
    
    internal func parseCollection<T: TTGenericDTO>(value: Any, type: T.Type) -> [T] {
        var result = [T]()
        for json in value as! [[String: AnyObject]] {
            let item = self.parseItem(value: json, type: type) as T
            result.append(item)
        }
        return result
    }
    
    
}

extension Dictionary {
    
    mutating func merge(with dictionary: Dictionary) {
        dictionary.forEach { updateValue($1, forKey: $0) }
    }
    
    func merged(with dictionary: Dictionary) -> Dictionary {
        var dict = self
        dict.merge(with: dictionary)
        return dict
    }
}

open class TTGenericService : NSObject {
    
    public typealias errorResultBlock = ((_ error: TTError)->Void)!
    
}

//
//  PlistManager.swift
//  TestTablePasoPaso
//
//  Created by Mariano D'Agostino on 5/3/17.
//  Copyright © 2017 Digital House. All rights reserved.
//

import Foundation

open class TTPlistManager {
    
    static open func readArray(name: String) -> [[String: AnyObject]] {
        var result: [[String: AnyObject]] = []
        if let plistPath = Bundle.main.path(forResource: name, ofType: "plist"), let plistData = FileManager.default.contents(atPath: plistPath) {
            var propertyListFormat =  PropertyListSerialization.PropertyListFormat.xml
            do {
                result = try PropertyListSerialization.propertyList(from: plistData, options: .mutableContainersAndLeaves, format: &propertyListFormat) as! [[String: AnyObject]]
            } catch {
                print("Error reading plist: \(error)")
            }
        }
        return result
    }
    
    static open func readDictionary(name: String) -> [String: AnyObject] {
        var result: [String: AnyObject] = [:]
        if let plistPath = Bundle.main.path(forResource: name, ofType: "plist"), let plistData = FileManager.default.contents(atPath: plistPath) {
            var propertyListFormat =  PropertyListSerialization.PropertyListFormat.xml
            do {
                result = try PropertyListSerialization.propertyList(from: plistData, options: .mutableContainersAndLeaves, format: &propertyListFormat) as! [String: AnyObject]
            } catch {
                print("Error reading plist: \(error)")
            }
        }
        return result
    }
    
    static open func readArrayToObject(name: String, object: TTGenericDTO.Type) -> [TTGenericDTO] {
        let array = readArray(name: name)
        var results: [TTGenericDTO] = []
        for itemDictionary in array {
            if let item = object.init(dictionary: itemDictionary) {
                results.append(item)
            }
        }
        return results
    }
    
    static open func readDictionaryToObject(name: String, object: TTGenericDTO.Type) -> TTGenericDTO {
        let itemDictionary = readDictionary(name: name)
        return object.init(dictionary: itemDictionary)!
    }
    
}

public class TTResult <T> {
    
    public var result: T?
    
    public var error: TTError?
    
}

public class TTError: TTGenericDTO {
    
    public var title: String?
    
    public var message: String?
    
    static public func errorFromMessage(_ message: String) -> TTError {
        let result = TTError()
        result.message = NSLocalizedString(message, comment: "")
        return result
    }
    
    static public func errorFromMessageAndTitle(_ message: String, title: String) -> TTError {
        let result = TTError.errorFromMessage(message)
        result.title = NSLocalizedString(title, comment: "")
        return result
    }
    
}






