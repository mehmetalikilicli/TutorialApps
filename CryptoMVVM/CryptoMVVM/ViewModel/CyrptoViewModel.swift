//
//  CyrptoViewModel.swift
//  CryptoMVVM
//
//  Created by Mehmet Ali Kılıçlı on 1.09.2022.
//

import Foundation

struct CyrptoViewModel {
    
    let cyrptoCurrency : CryptoCurrency
    
    var name : String {
        return self.cyrptoCurrency.currency
    }
    
    var price : String {
        return self.cyrptoCurrency.price
    }
}
