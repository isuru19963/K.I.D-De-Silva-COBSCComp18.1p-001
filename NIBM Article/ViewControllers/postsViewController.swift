//
//  postsViewController.swift
//  NIBM Article
//
//  Created by Isuru Devinda on 11/20/2562 BE.
//  Copyright © 2562 BE Isuru Devinda. All rights reserved.
//

import UIKit
import Nuke
class postsViewController: UIViewController {
    var posts: AddPostModel? = nil

    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var studentImage: UIImageView!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postDescription: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        studentImage.layer.cornerRadius = studentImage.frame.width / 2
        
        // Do any additional setup after loading the view.
        
        if posts != nil{
            
            let url = URL(string: ((posts?.image_url)!))
            
            Nuke.loadImage(with: url!, into: studentImage)
            
            postTitle.text = posts?.title
            postDescription.text = posts?.description
            
        }
    }
    
    
}

