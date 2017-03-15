//
//  Post.swift
//  StatusHub
//
//  Created by Subodh Jena on 15/03/17.
//  Copyright © 2017 Cuckoo Labs. All rights reserved.
//

import Foundation


public class Post {
    
    public var id : String?
    public var user : User?
    public var message : String?
    public var createdAt : String?
    public var updatedAt : String?
    
    /**
     Returns an array of models based on given dictionary.
     
     Sample usage:
     let postList = Post.modelsFromDictionaryArray(someDictionaryArrayFromJSON)
     
     - parameter array:  NSArray from JSON dictionary.
     
     - returns: Array of Post Instances.
     */
    public class func modelsFromDictionaryArray(array:NSArray) -> [Post] {
       
        var models:[Post] = []
        
        for item in array
        {
            models.append(Post(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    /**
     Constructs the object based on the given dictionary.
     
     Sample usage:
     let json4Swift_Base = Json4Swift_Base(someDictionaryFromJSON)
     
     - parameter dictionary:  NSDictionary from JSON.
     
     - returns: Post Instance.
     */
    required public init?(dictionary: NSDictionary) {
        
        id = dictionary["id"] as? String
        if (dictionary["user"] != nil) { user = User(dictionary: dictionary["user"] as! NSDictionary) }
        message = dictionary["message"] as? String
        createdAt = dictionary["createdAt"] as? String
        updatedAt = dictionary["updatedAt"] as? String
    }
    
    
    /**
     Returns the dictionary representation for the current instance.
     
     - returns: NSDictionary.
     */
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.user?.dictionaryRepresentation(), forKey: "user")
        dictionary.setValue(self.message, forKey: "message")
        dictionary.setValue(self.createdAt, forKey: "createdAt")
        dictionary.setValue(self.updatedAt, forKey: "updatedAt")
        
        return dictionary
    }
    
}
