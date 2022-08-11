//
//  SettingsViewController.swift
//  instagramCloneFirebase
//
//  Created by Mehmet Ali Kılıçlı on 10.08.2022.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutClicked(_ sender: Any) {
        
        do{
            try Auth.auth().signOut()
            performSegue(withIdentifier: "toViewController", sender: nil)
            
        }catch{
            print("error")
        }
    }
}
