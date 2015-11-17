//
//  PostCell.swift
//  MyHood
//
//  Created by Abdurrahman on 11/14/15.
//  Copyright © 2015 Hafiz Developer. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    // Connections
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        postImage.layer.cornerRadius = postImage.frame.size.width / 2
        postImage.clipsToBounds = true
        
    }

    func configureCell(post: Post) {
        
        titleLabel.text = post.title
        descriptionLabel.text = post.postDescription
        
        postImage.image = DataService.instance.imageForPath(post.imagePath)
    }
    
    
}
