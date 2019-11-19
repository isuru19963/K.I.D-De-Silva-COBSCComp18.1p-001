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
    var addedTime: Date!
    
    init(title: String, description: String, addedTime: Date) {
        self.title = title
        self.description = description
        self.addedTime = addedTime
    }
    
    
    
    
}
