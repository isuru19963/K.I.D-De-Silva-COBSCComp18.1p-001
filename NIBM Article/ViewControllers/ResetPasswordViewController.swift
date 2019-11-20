//
//  ResetPasswordViewController.swift
//  NIBM Article
//
//  Created by Isuru Devinda on 11/20/2562 BE.
//  Copyright © 2562 BE Isuru Devinda. All rights reserved.
//

import UIKit
import Firebase

class ResetPasswordViewController: UIViewController {
    
    
    @IBOutlet weak var email: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func resetPasswordClick(_ sender: Any) {
        if email.text == "" {
            self.alert(message: "Enter your email")
            return
        }
        
        if !isValidEmail(testStr: email.text!) {
            self.alert(message: "Not a valid email")
            return
        }
        
        Auth.auth().sendPasswordReset(withEmail: email.text!) { error in
            if (error != nil){
                self.alert(message: error?.localizedDescription ?? "Error")
                return
            }
            
            self.alert(message: "A password reset email has been sent to your account")
            
            
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
