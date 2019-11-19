//
//  SignInViewController.swift
//  NIBM Article
//
//  Created by Isuru Devinda on 11/16/2562 BE.
//  Copyright © 2562 BE Isuru Devinda. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet var signInButton: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInButton.layer.cornerRadius = 8
        
        navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
    }
    

    @IBAction func signInClick(_ sender: Any) {
        if email.text?.isEmpty ?? true {
            self.alert(message: "Enter Email")
            return
        }
        
        if password.text?.isEmpty ?? true {
            self.alert(message: "Enter Password")
        }
        
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { [weak self] user, error in
            guard let strongSelf = self else { return }
            
            if (error != nil){
                strongSelf.alert(message: error?.localizedDescription ?? "Error")
                return
            }else{
                strongSelf.performSegue(withIdentifier: "homeNavVC", sender: self)
                
            }
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
