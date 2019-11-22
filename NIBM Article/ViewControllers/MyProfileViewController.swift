//
//  MyProfileViewController.swift
//  NIBM Article
//
//  Created by Isuru Devinda on 11/21/2562 BE.
//  Copyright © 2562 BE Isuru Devinda. All rights reserved.
//

import UIKit
import Firebase
import SwiftyJSON
import Nuke

class MyProfileViewController: UIViewController {
    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var mobilNo: UITextField!
    @IBOutlet weak var batch: UITextField!
    var window: UIWindow?

   var imagePicker:UIImagePickerController!
      var ref = DatabaseReference.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        self.ref = Database.database().reference()
        
        imageUser.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
          self.window = UIWindow(frame: UIScreen.main.bounds)
//
//       let loggedUserEmail = UserDefaults.standard.string(forKey: "LoggedUser")
//
//
//        let ref = Database.database().reference().child("users").child(loggedUserEmail!)
//        ref.observe(.value, with: { snapshot in
//
//            let dict = snapshot.value as? [String: AnyObject]
//            let json = JSON(dict as Any)
//
//            let imageURL = URL(string: json["imageUrl"].stringValue)
//            Nuke.loadImage(with: imageURL!, into: self.imageUser)
//
//            self.firstName.text = json["firstName"].stringValue
//            self.lastName.text = json["lastName"].stringValue
//            self.mobilNo.text = json["mobilNo"].stringValue
//            self.batch.text = json["batch"].stringValue
//        
//
//        })
        // Do any additional setup after loading the view.
    }
    @IBAction func signOut(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        UserDefaults.standard.removeObject(forKey: "LoggedUser")
        UserDefaults.standard.removeObject(forKey: "LoggedIn")
        UserDefaults.standard.removeObject(forKey: "UserUID")
        UserDefaults.standard.synchronize()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let initialViewController = storyboard.instantiateViewController(withIdentifier: "signInVc")
        
        self.window?.rootViewController = initialViewController
        self.window?.makeKeyAndVisible()
        
    }
    
    @IBAction func changeImage(_ sender: Any) {
        
         self.present(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func saveUser(_ sender: Any) {
        if (firstName.text == "") {
            alert(message: "title is required")
            return
        }
        
        if (lastName.text == ""){
            alert(message: "Description Is Required")
            return
        }
        if (imageUser.image == nil){
            alert(message: "Image Is Required")
            return
        }
        self.saveFIRData()
        navigationController?.popViewController(animated: true)
        
    }
    func saveFIRData(){
        self.uploadMedia(image: imageUser.image!){ url in
            self.saveImage(profileImageURL: url!){ success in
                if (success != nil){
                    self.dismiss(animated: true, completion: nil)
                }
                
            }
        }
    }
    
    
    func uploadMedia(image :UIImage, completion: @escaping ((_ url: URL?) -> ())) {
        let imageName = UUID().uuidString
        let storageRef = Storage.storage().reference().child("users").child(imageName)
        let imgData = self.imageUser.image?.pngData()
        let metaData = StorageMetadata()
        metaData.contentType = "image/png"
        storageRef.putData(imgData!, metadata: metaData) { (metadata, error) in
            if error == nil{
                storageRef.downloadURL(completion: { (url, error) in
                    completion(url)
                })
            }else{
                print("error in save image")
                completion(nil)
            }
        }
    }
    
    func saveImage(profileImageURL: URL , completion: @escaping ((_ url: URL?) -> ())){
        let loggedUserEmail = UserDefaults.standard.string(forKey: "LoggedUser")
        let dict = ["firstName": firstName.text!,
                    "lastName": lastName.text!,
                    "imageUrl": profileImageURL.absoluteString,
                    "mobilNo": mobilNo.text!,
                     "batch": batch.text!,
                    "email":loggedUserEmail!] as [String : Any]
        self.ref.child("users").childByAutoId().setValue(dict)
        self.alert(message: "Updted Successfully")
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

extension MyProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.imageUser.image = pickedImage
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    
}
