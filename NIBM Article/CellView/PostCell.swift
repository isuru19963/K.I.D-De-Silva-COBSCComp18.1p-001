//
//  PostCell.swift
//  NIBM Article
//
//  Created by Isuru Devinda on 11/20/2562 BE.
//  Copyright © 2562 BE Isuru Devinda. All rights reserved.
//


import UIKit
import Nuke

class PostCell: UITableViewCell {

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
    }
    
    func setData(student : posts){
        
        name.text = student.firstName
        city.text = student.city
        
        let url = URL(string: student.imageURL)
        
        Nuke.loadImage(with: url!, into: profileImage)
        
        
    }
    
}
