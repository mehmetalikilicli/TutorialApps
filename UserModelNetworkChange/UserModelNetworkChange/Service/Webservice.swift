//
//  Webservice.swift
//  UserModelNetworkChange
//
//  Created by Mehmet Ali Kılıçlı on 7.09.2022.
//

import Foundation

class Webservice : NetworkService {
    
    var type : String = "Webservice"
    
    
    enum NetworkError : Error {
        case invalidUrl
        case invalidServerResponse
    }
    
    
    func download(_ resource: String) async throws -> [User] {
        
        guard let url = URL(string: resource) else {
            throw NetworkError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidServerResponse
        }
        
        return try JSONDecoder().decode([User].self, from: data)
        
    }
    
}

