//
//  SecondViewController.swift
//  SegueApp
//
//  Created by Mehmet Ali Kılıçlı on 28.07.2022.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var myLabelSecond: UILabel!
    var myName = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = myName

        // Do any additional setup after loading the view.
    }
    

   

}
