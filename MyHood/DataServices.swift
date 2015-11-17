//
//  DataServices.swift
//  MyHood
//
//  Created by Abdurrahman on 11/14/15.
//  Copyright © 2015 Hafiz Developer. All rights reserved.
//

import Foundation
import UIKit

class DataService {

    static let instance = DataService()
    
    let KEY_POSTS = "posts"
    private var _loadedPosts = [Post]()
    
    var loadedPosts: [Post] {
        return _loadedPosts
    }
    
    func savePosts() {
        let postsData = NSKeyedArchiver.archivedDataWithRootObject(_loadedPosts)
        NSUserDefaults.standardUserDefaults().setObject(postsData, forKey: "posts")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func loadPosts() {
        if let postsData = NSUserDefaults.standardUserDefaults().objectForKey(KEY_POSTS) as? NSData {
            
            if let postsArray = NSKeyedUnarchiver.unarchiveObjectWithData(postsData) as? [Post] {
                _loadedPosts = postsArray
            }
        }
        
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "postsLoaded", object: nil))
    }

    func saveImageAndCreatePath(image: UIImage) -> String {
        let imageData = UIImagePNGRepresentation(image)
        let imagePath = "image\(NSDate.timeIntervalSinceReferenceDate()).png"
        let fullPath = documentsPathForFileName(imagePath)
        imageData?.writeToFile(fullPath, atomically: true)
        
        return imagePath
    }
    
    func imageForPath(path: String) -> UIImage? {
        let fullPath = documentsPathForFileName(path)
        let image = UIImage(named: fullPath)
        
        return image
    }

    func addPost(post: Post) {
        _loadedPosts.append(post)
        
        savePosts()
        loadPosts()
    }

    
    func documentsPathForFileName(name: String) -> String {
        
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        
        let fullPath = paths[0] as NSString
        
        return fullPath.stringByAppendingString(name)
    }
    


}

