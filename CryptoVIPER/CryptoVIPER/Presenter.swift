//
//  Presenter.swift
//  CryptoVIPER
//
//  Created by Mehmet Ali Kılıçlı on 2.09.2022.
//

import Foundation

// Class, protocol
// Talks to -> Interacter, router, view

enum NetworkError : Error {
    case NetworkFailed
    case ParsingFailed
}
protocol AnyPresenter {
    var router : AnyRouter? {get set}
    var interactor : AnyInteractor? {get set}
    var view : AnyView? {get set}
    
    func interactorDidDownloadCrypto(result:Result<[Crypto],Error>)
}




class CryptoPresenter : AnyPresenter {
    
    var view: AnyView?
    
    var interactor: AnyInteractor? {
        didSet {
            interactor?.downloadCryptos()
        }
    }
    
    var router: AnyRouter?
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>) {
        
        switch result {
        case .success(let cryptos):

            view?.update(with: cryptos)

        case .failure(let error):
            view?.update(with: "Try Again Later...")        }
        
        
        
    }
    
    
}


