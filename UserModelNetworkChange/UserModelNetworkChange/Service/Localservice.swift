//
//  Localservice.swift
//  UserModelNetworkChange
//
//  Created by Mehmet Ali Kılıçlı on 7.09.2022.
//

import Foundation

class LocalService : NetworkService {
    
    var type : String = "Localservice"

    
    func download(_ resource: String) async throws -> [User] {
        
        guard let path = Bundle.main.path(forResource: resource, ofType: "json") else {
            fatalError("Resource not found")
        }
        
        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        
        return try JSONDecoder().decode([User].self, from: data)
        
    }
}

