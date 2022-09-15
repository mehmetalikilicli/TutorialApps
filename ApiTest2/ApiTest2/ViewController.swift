//
//  ViewController.swift
//  ApiTest2
//
//  Created by Mehmet Ali Kılıçlı on 13.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cekVeri()
        
        
        
    }
    func cekVeri(){
        let httpUrl = "https://api.shopiroller.com/v2.0/categories"
        guard let url = URL(string: httpUrl) else {
            return
        }
        var request = URLRequest(url: url)
        request.setValue("xXspnfUxPzOGKNu90bFAjlOTnMLpN8veiixvEFXUw9I=", forHTTPHeaderField: "Api-Key")
        request.setValue("AtS1aPFxlIdVLth6ee2SEETlRxk=", forHTTPHeaderField: "Alias-Key")
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            let decoder = JSONDecoder()
            let veri = try? decoder.decode(Json4Swift_Base.self, from: data!)
            print(veri?.data![0].categoryId)
        }
        task.resume()
    }
    
}
