//
//  CryptoListViewModel.swift
//  CryptoMVVM
//
//  Created by Mehmet Ali Kılıçlı on 23.11.2022.
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
