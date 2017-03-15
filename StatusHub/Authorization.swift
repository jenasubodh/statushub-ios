//
//  Authorization.swift
//  StatusHub
//
//  Created by Subodh Jena on 16/03/17.
//  Copyright © 2017 Cuckoo Labs. All rights reserved.
//

import Foundation

public class Authorization {
    
    public var token : String?
    public var user : User?
    
    /**
     Returns an array of models based on given dictionary.
     
     Sample usage:
     let AuthorizationList = Authorization.modelsFromDictionaryArray(someDictionaryArrayFromJSON)
     
     - parameter array:  NSArray from JSON dictionary.
     
     - returns: Array of Authorization Instances.
     */
    public class func modelsFromDictionaryArray(array:NSArray) -> [Authorization]
    {
        var models:[Authorization] = []
        for item in array
        {
            models.append(Authorization(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    /**
     Constructs the object based on the given dictionary.
     
     Sample usage:
     let Authorization = Authorization(someDictionaryFromJSON)
     
     - parameter dictionary:  NSDictionary from JSON.
     
     - returns: Authorization Instance.
     */
    required public init?(dictionary: NSDictionary) {
        
        token = dictionary["token"] as? String
        if (dictionary["user"] != nil) { user = User(dictionary: dictionary["user"] as! NSDictionary) }
    }
    
    
    /**
     Returns the dictionary representation for the current instance.
     
     - returns: NSDictionary.
     */
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.token, forKey: "token")
        dictionary.setValue(self.user?.dictionaryRepresentation(), forKey: "user")
        
        return dictionary
    }
    
}
