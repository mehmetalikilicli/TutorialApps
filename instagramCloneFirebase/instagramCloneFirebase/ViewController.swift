//
//  ViewController.swift
//  instagramCloneFirebase
//
//  Created by Mehmet Ali Kılıçlı on 10.08.2022.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @IBAction func signInClicked(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { authdata, error
                in
                if error != nil{
                    self.makeAlert(titleIntup: "Error", messageInput: error?.localizedDescription ?? "Error")
                    
                }
                else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
        }
        else{
            makeAlert(titleIntup: "Error", messageInput: "Username/Password?")
            
        }
        
        
        
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { authdata, error in
                if error != nil {
                    self.makeAlert(titleIntup: "Error", messageInput: error?.localizedDescription ?? "Error")
                }
                else{
                    
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }
        else {
            makeAlert(titleIntup: "Error", messageInput: "Username/Password?")
        }
        
    }
    
    func makeAlert (titleIntup:String, messageInput:String){
        let alert = UIAlertController(title: titleIntup, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:  nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}

