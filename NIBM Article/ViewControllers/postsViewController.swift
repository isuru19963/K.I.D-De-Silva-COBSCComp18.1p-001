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
    var student: AddPostModel? = nil
    @IBOutlet weak var studentImage: UIImageView!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var facebookLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        studentImage.layer.cornerRadius = studentImage.frame.width / 2
        
        // Do any additional setup after loading the view.
        
        if student != nil{
            
            let url = URL(string: ((student?.imageURL)!))
            
            Nuke.loadImage(with: url!, into: studentImage)
            
            firstNameLabel.text = student?.firstName
            lastNameLabel.text = student?.lastName
            cityLabel.text = student?.city
            phoneNumberLabel.text = student?.phoneNumber
            dobLabel.text = student?.birthday
            facebookLabel.text = student?.fbUrl
            
        }
    }
    
    
}

