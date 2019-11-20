//
//  AddPostViewController.swift
//  NIBM Article
//
//  Created by Isuru Devinda on 11/20/2562 BE.
//  Copyright © 2562 BE Isuru Devinda. All rights reserved.
//

import UIKit
import Firebase

class AddPostViewController: UIViewController {
    @IBOutlet weak var postTitle: UITextField!
    @IBOutlet weak var postDesc: UITextField!
    @IBOutlet weak var postIMAGE: UIImageView!
    @IBOutlet weak var user: UITextField!
    
    var imagePicker:UIImagePickerController!
  

  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self 
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickPick(_ sender: Any) {
        
        
        self.present(imagePicker, animated: true, completion: nil)
        
    }

        
    
        
    
    
    @IBAction func savePost(_ sender: Any) {
        if (postTitle.text == "") {
            alert(message: "title is required")
            return
        }
        
        if (postDesc.text == ""){
            alert(message: "Description Is Required")
            return
        }
        
        let posts = AddPostModel(title: postTitle.text ?? "", description: postDesc.text ?? "" ,user: user.text ?? "" ,image_url: "")
        
        var workList = UserDefaults.standard.decode(for: [AddPostModel].self, using: String(describing: AddPostModel.self))
        
        //cheack if old saved items available
        if (workList == nil || (workList?.isEmpty)!) {
            //if not available add a new array
            UserDefaults.standard.encode(for:[posts], using: String(describing: AddPostModel.self))
        } else {
            //if available append to array and save
            workList?.append(posts)
            UserDefaults.standard.encode(for:workList, using: String(describing: AddPostModel.self))
        }
        
        //go back
        navigationController?.popViewController(animated: true)
        
    }

    
}
extension AddPostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.postIMAGE.image = pickedImage
        }
        
        picker.dismiss(animated: true, completion: nil)
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



