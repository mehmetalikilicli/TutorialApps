//
//  ViewController.swift
//  HesapMakinasi
//
//  Created by Mehmet Ali Kılıçlı on 25.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var resultLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func sumClicked(_ sender: Any) {
        
        if let firstNumber = Int(textField1.text!)
        {
            if let secondNumber = Int(textField2.text!){
                
                let result = firstNumber+secondNumber
                
                resultLabel.text = String(result)
                
            }
        }
    }
    @IBAction func minusClicked(_ sender: Any) {
        
        if let firstNumber = Int(textField1.text!)
        {
            if let secondNumber = Int(textField2.text!){
                
                let result = firstNumber-secondNumber
                
                resultLabel.text = String(result)
                
            }
        }
    }
    
    @IBAction func multipleClicked(_ sender: Any) {
        
        if let firstNumber = Int(textField1.text!)
        {
            if let secondNumber = Int(textField2.text!){
                
                let result = firstNumber*secondNumber
                
                resultLabel.text = String(result)
            }
        }
    }
    @IBAction func devideClicked(_ sender: Any) {
        
        if let firstNumber = Int(textField1.text!)
        {
            if let secondNumber = Int(textField2.text!){
                
                let result = firstNumber/secondNumber
                
                resultLabel.text = String(result)
                
            }
        }
    }
}
    
    
    


