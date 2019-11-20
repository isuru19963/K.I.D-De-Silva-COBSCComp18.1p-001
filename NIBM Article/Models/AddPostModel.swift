//
//  AddPostModel.swift
//  NIBM Article
//
//  Created by Isuru Devinda on 11/20/2562 BE.
//  Copyright © 2562 BE Isuru Devinda. All rights reserved.
//

import Foundation

struct AddPostModel: Codable {
    
    var title : String!
    var description : String!
    var user: String!
    var image_url: String!
    
    init(title: String, description: String,user: String,image_url:String) {
        self.title = title
        self.description = description
        self.user=user
        self.image_url=image_url
    }
    
    
    
    
}
