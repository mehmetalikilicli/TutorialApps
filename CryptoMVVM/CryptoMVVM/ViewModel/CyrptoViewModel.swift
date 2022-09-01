//
//  CyrptoViewModel.swift
//  CryptoMVVM
//
//  Created by Mehmet Ali Kılıçlı on 1.09.2022.
//

import Foundation

struct CyrptoListViewModel {
    
    let cyrptoCurrencyList : [CryptoCurrency]
    
    func numberofRowsInSection() -> Int {
        return self.cyrptoCurrencyList.count
    }
    
    
    func cyrptoAtIndex(_ index: Int) -> CyrptoViewModel{
        
        let cyrpto = self.cyrptoCurrencyList[index]
        return CyrptoViewModel(cyrptoCurrency: cyrpto)
        
        
    }
}


struct CyrptoViewModel {
    
    let cyrptoCurrency : CryptoCurrency
    
    var name : String {
        return self.cyrptoCurrency.currency
    }
    
    var price : String {
        return self.cyrptoCurrency.price
    }
    
    
}
