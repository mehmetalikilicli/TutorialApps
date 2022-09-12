//
//  ViewController.swift
//  ApiTest
//
//  Created by Mehmet Ali Kılıçlı on 10.09.2022.
//

import UIKit
import Foundation
import Alamofire

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let url = "https://api.sunrise-sunset.org/json?date=2022-05-01&lat=-74.0060&lng=40.7128&formatterd=0"
        
        getData(from: url)
        
    }
    
    
    private func getData(from url: String) {
        
        
        AF.request(url, method: .get).responseDecodable(of: Response.self ) { response in
            
            switch response.result {
            case .success(let data):
                let results = response.result
                print(results)
            case . failure(let error):
                print(error)
            }
            
        }
        
        
        
    }
}

