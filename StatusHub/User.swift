//
//  User.swift
//  StatusHub
//
//  Created by Subodh Jena on 15/03/17.
//  Copyright © 2017 Cuckoo Labs. All rights reserved.
//

import Foundation


public class User {
    
    public var id : String?
    public var name : String?
    public var picture : String?
    public var email : String?
    public var createdAt : String?
    
    /**
     Returns an array of models based on given dictionary.
     
     Sample usage:
     let user_list = User.modelsFromDictionaryArray(someDictionaryArrayFromJSON)
     
     - parameter array:  NSArray from JSON dictionary.
     
     - returns: Array of User Instances.
     */
    public class func modelsFromDictionaryArray(array:NSArray) -> [User]
    {
        var models:[User] = []
        for item in array
        {
            models.append(User(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    /**
     Constructs the object based on the given dictionary.
     
     Sample usage:
     let user = User(someDictionaryFromJSON)
     
     - parameter dictionary:  NSDictionary from JSON.
     
     - returns: User Instance.
     */
    required public init?(dictionary: NSDictionary) {
        
        id = dictionary["id"] as? String
        name = dictionary["name"] as? String
        picture = dictionary["picture"] as? String
        email = dictionary["email"] as? String
        createdAt = dictionary["createdAt"] as? String
    }
    
    
    /**
     Returns the dictionary representation for the current instance.
     
     - returns: NSDictionary.
     */
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.name, forKey: "name")
        dictionary.setValue(self.picture, forKey: "picture")
        dictionary.setValue(self.email, forKey: "email")
        dictionary.setValue(self.createdAt, forKey: "createdAt")
        
        return dictionary
    }
    
}
