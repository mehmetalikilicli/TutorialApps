//
//  WebService.swift
//  CryptoMVVM
//
//  Created by Mehmet Ali Kılıçlı on 1.09.2022.
//

import Foundation

class WebService {
    
    func getCurrencies(url: URL, completion: @escaping([CryptoCurrency]?) -> ()){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let cryptoList = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
                
                print(cryptoList)
                
                if let cryptoList = cryptoList {
                    completion(cryptoList)
                }
                
            }
        }.resume()
        
        
        
    }
    
    
}
