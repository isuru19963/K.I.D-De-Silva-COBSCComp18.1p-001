//
//  HomeViewController.swift
//  NIBM Article
//
//  Created by Isuru Devinda on 11/18/2562 BE.
//  Copyright © 2562 BE Isuru Devinda. All rights reserved.
//

import UIKit
import Firebase
import LocalAuthentication

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logout(_ sender: Any) {
        
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            
            self.performSegue(withIdentifier: "goToSignIn", sender: nil)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
