//
//  JokesViewModel.swift
//  JokesAppSwiftUI
//
//  Created by Mehmet Ali Kılıçlı on 6.09.2022.
//

import Foundation
import Alamofire

class JokesViewModel : ObservableObject {
    
    @Published var jokes = [Value]()

    init() {
        getJokes()
    }
    
    func getJokes(count: Int = 6) {
        AF.request("http://api.icndb.com/jokes/random/\(count)",method: .get).responseDecodable(of: Jokes.self) { response in
            switch response.result {
            case .success(let data):
                let value = data.value
                self.jokes += value
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
