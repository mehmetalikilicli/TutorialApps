//
//  ViewController.swift
//  BirthdayNoteApp
//
//  Created by Mehmet Ali Kılıçlı on 27.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if let newName = storedName as? String {
            nameLabel.text = newName
        }
        
        if let newBirthday = storedBirthday as? String {
            birthdayLabel.text = newBirthday
        }


    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        
        UserDefaults.standard.set(nameTextField.text!, forKey: "name")
        UserDefaults.standard.set(birthdayTextField.text!, forKey: "birthday")
        
        let userName = nameTextField.text
        let userBirthday = birthdayTextField.text
        
        nameLabel.text = userName
        birthdayLabel.text = userBirthday
        
    }
    
    
    @IBAction func deleteButton(_ sender: Any) {
        
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        
        if storedName is String{
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "Name: "
        }
        
        if storedBirthday is String{
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayLabel.text = "Birthday: "
        }
        
        
        
    }
    
    
    
    
    
}

