//
//  SignUpViewController.swift
//  NIBM Article
//
//  Created by Isuru Devinda on 11/18/2562 BE.
//  Copyright © 2562 BE Isuru Devinda. All rights reserved.
//

import UIKit
import Firebase
class SignUpViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var confirm_password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signUpClick(_ sender: Any) {
        if email.text == "" {
            self.alert(message: "enter a email")
            return
        }
        
        if !isValidEmail(testStr: email.text ?? ""){
            self.alert(message: "Enter a valid email")
            return
        }
        
        if password.text == "" {
            self.alert(message: "Enter a password")
            return
        }
        
        if password.text != confirm_password.text {
            self.alert(message: "Passwords does not match")
            return
        }
        
        
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) { authResult, error in
            if (error != nil) {
                self.alert(message: error?.localizedDescription ?? "Error")
                return
            }
            
            //user created
            self.performSegue(withIdentifier: "signInVc", sender: nil)
            
            
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
