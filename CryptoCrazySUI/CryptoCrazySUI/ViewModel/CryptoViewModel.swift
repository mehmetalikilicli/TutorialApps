//
//  CryptoViewModel.swift
//  CryptoCrazySUI
//
//  Created by Mehmet Ali Kılıçlı on 5.09.2022.
//

import Foundation


class CryptoListViewModel: ObservableObject {
    
    @Published var cryptoList = [CryptoViewModel]()
    
    let webService = WebService()
    
    func downloadCryptos (url: URL) {
        
        webService.downloadCurrencies(url: url) { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let cryptos) :
                if let cryptos = cryptos {
                    DispatchQueue.main.async {
                        self.cryptoList = cryptos.map(CryptoViewModel.init)
                    }
                }
            }
        }
    }
    
}


struct CryptoViewModel {
    
    let crypto :Cryptocurrency
    
    var id : UUID? {
        crypto.id
    }
    
    var currency : String {
        crypto.currency
    }
    
    var price: String {
        crypto.price
    }
    
}
