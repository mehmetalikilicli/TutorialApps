//
//  CryptoCurrency.swift
//  CryptoCrazySUI
//
//  Created by Mehmet Ali Kılıçlı on 5.09.2022.
//

import Foundation


struct Cryptocurrency : Decodable, Identifiable {
    
    let id = UUID()
    let currency : String
    let price : String
    
    private enum CodingKeys : String, CodingKey {
        case currency = "currency"
        case price = "price"
    }
    
}
