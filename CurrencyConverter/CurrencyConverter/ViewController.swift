//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Mehmet Ali Kılıçlı on 17.08.2022.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var chfLable: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var eurLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func getRatesClicked(_ sender: Any) {
        
        // 1 - Request & Session
        // 2 - Response & Data
        // 3 - Parsing & JSON Serialization
        
        //Request
        
        
            let url = URL(string: "https://api.apilayer.com/currency_data/live?source=USD&apikey=0c82MFjtNkt15QRq1hjbzz85pxgV6RtH")
        
        
        
        let session = URLSession.shared
        
        //Closure
        
        let task = session.dataTask(with: url!) { data, response, error in
            if error != nil{
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            }else {
                //Response
                if data != nil {
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!,options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                        //ASYNC
                        
                        DispatchQueue.main.async {

                            if let quotes = jsonResponse["quotes"] as? [String :  Any]{
                                print(quotes)
                                
                                if let cad = quotes["USDCAD"] as? Double {
                                    self.cadLabel.text = "CAD: \(cad)"
                                }
                                if let chf = quotes["USDCHF"] as? Double {
                                    self.chfLable.text = "CHF: \(chf)"
                                }
                                if let gbp = quotes["USDGBP"] as? Double {
                                    self.gbpLabel.text = "GBP: \(gbp)"
                                }
                                if let jpy = quotes["USDJPY"] as? Double {
                                    self.jpyLabel.text = "JPY: \(jpy)"
                                }
                                if let eur = quotes["USDEUR"] as? Double {
                                    self.eurLabel.text = "EUR: \(eur)"
                                }
                                if let turkish = quotes["USDTRY"] as? Double {
                                    self.tryLabel.text = "TRY: \(turkish)"
                                }
                            }
                            
                            
                            
                        }
                        
                    } catch {
                        print("Error")
                    }
                }
            }
        }
        
        task.resume()
        
    }
    
}

