//
//  ViewController.swift
//  ApiTest
//
//  Created by Mehmet Ali Kılıçlı on 10.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
    }
    
    func getData() {
        
        GetCategoriesService().getCategoriesData(completion: { categories in
            
            if let categories = categories {
                print(categories[1].categoryId)
            }
        }
        )}
}
