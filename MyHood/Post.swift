//
//  Post.swift
//  MyHood
//
//  Created by Abdurrahman on 11/14/15.
//  Copyright © 2015 Hafiz Developer. All rights reserved.
//

import Foundation

class Post: NSObject, NSCoding {
    
    private var _imagePath: String!
    private var _title: String!
    private var _postDescription: String!
    
    var imagePath: String {
        return _imagePath
    }
    
    var title: String {
        return _title
    }
    
    var postDescription: String {
        return _postDescription
    }
    
    init (imagePath: String, title: String, description: String) {
        self._imagePath = imagePath
        self._title = title
        self._postDescription = description
    }
    
    
    
    override init() {
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        
        self._imagePath = aDecoder.decodeObjectForKey("imagePath") as? String
        self._title = aDecoder.decodeObjectForKey("title") as? String
        self._postDescription = aDecoder.decodeObjectForKey("description") as? String
        
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(_imagePath, forKey: "imagePath")
        aCoder.encodeObject(_title, forKey: "title")
        aCoder.encodeObject(_postDescription, forKey: "description")
    }
    
    
    
}


