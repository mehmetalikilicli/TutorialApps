//
//  ViewController.swift
//  Alert
//
//  Created by Mehmet Ali Kılıçlı on 29.07.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordAgainTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    

    @IBAction func signUpButton(_ sender: Any) {
        
        var alert = UIAlertController()
        
        
        if usernameTextField.text == "" {
              makeAlert(title: "Error", message: "Username can't be empty!")
        }
        else if passwordTextField.text == "" {
            makeAlert(title: "Error", message: "Password can't be empty!")
        }
        else if passwordTextField.text != passwordAgainTextField.text {
             makeAlert(title: "Error", message: "Password can't be different!")
        }
        else{
             makeAlert(title: "Success", message: "User is sign up!")

        }
        //This for deneme
        
        
        
       
         
    }
    
    
    func makeAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (UIAlertAction) in
            print("Button clicked!")
        }
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
        
        
    }
    
}

