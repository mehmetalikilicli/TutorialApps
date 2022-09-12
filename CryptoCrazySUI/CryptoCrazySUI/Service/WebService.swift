//
//  WebService.swift
//  CryptoCrazySUI
//
//  Created by Mehmet Ali Kılıçlı on 5.09.2022.
//

import Foundation


class WebService {
    
    func downloadCurrencies(url: URL, completion: @escaping (Result<[Cryptocurrency]?,DownloadError>) -> Void){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(.badUrl))
            }
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let currencies = try? JSONDecoder().decode([Cryptocurrency].self, from: data) else {
                return completion(.failure(.dataParseError))
            }
            completion(.success(currencies))
            
        }.resume()
        
    }
    
    enum DownloadError : Error {
        case badUrl
        case noData
        case dataParseError
    }
    
}
