//
//  upLoadViewController.swift
//  instagramCloneFirebase
//
//  Created by Mehmet Ali Kılıçlı on 10.08.2022.
//

import UIKit
import Firebase

class upLoadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var commentText: UITextField!
    @IBOutlet weak var uploadButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        imageView.addGestureRecognizer(gestureRecognizer)
        
        
    }
    
    @objc func chooseImage(){
        
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true,completion: nil)
    }
    
    
    func makeAlert (titleIntup:String, messageInput:String){
        let alert = UIAlertController(title: titleIntup, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:  nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func uploadButtonClicked(_ sender: Any) {
        
        let storage = Storage.storage()
        let storageReference = storage.reference()
        
        let mediaFolder = storageReference.child("media")
        
        
        
        
        
        if let data = imageView.image?.jpegData(compressionQuality: 0.1){
            
            let uuid = UUID().uuidString
            let imageReference = mediaFolder.child("\(uuid).jpg")
            
            imageReference.putData(data, metadata: nil) { metadata, error in
                if error != nil {
                    self.makeAlert(titleIntup: "Error!", messageInput: error?.localizedDescription ?? "Error!")                }
                else{
                    imageReference.downloadURL { url, error in
                        if error == nil {
                            let imageUrl = url?.absoluteString

                            
                            //DataBase
                            
                            let fireStoreDatabase = Firestore.firestore()
                            
                            var fireStoreReference : DocumentReference? = nil
                            
                            
                            let fireStorePost = ["imageUrl" : imageUrl! ,
                                                 "postedBy" : Auth.auth().currentUser!.email!,
                                                 "postComment" : self.commentText.text!,
                                                 "date" : FieldValue.serverTimestamp(),
                                                 "likes" : 0,
                            ] as [String : Any]
                            
                            fireStoreReference = fireStoreDatabase.collection("Posts").addDocument(data: fireStorePost, completion: { error in
                                if error != nil{
                                    self.makeAlert(titleIntup: "Error", messageInput: error?.localizedDescription ?? "Error")
                                }
                                else{
                                    self.imageView.image = UIImage(named: "select.png")
                                    self.commentText.text = ""
                                    self.tabBarController?.selectedIndex = 0
                                    
                                }
                            })


                        }
                    }
                }
            }
        }
        
    }
    
}
