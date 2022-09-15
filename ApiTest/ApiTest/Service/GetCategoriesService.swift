//
//  GetCategoriesService.swift
//  ApiTest
//
//  Created by Mehmet Ali Kılıçlı on 12.09.2022.
//

import Foundation
import Alamofire


class GetCategoriesService : ObservableObject{
    
    @Published var categories : [Data]?
    
    func getCategoriesData(completion: @escaping([Data]?) -> ()) {
        let httpUrl = Constants.Urls.getCategoriesUrl
        guard let url = URL(string: httpUrl) else {
            return
        }
        var request = URLRequest(url: url)
        request.setValue("xXspnfUxPzOGKNu90bFAjlOTnMLpN8veiixvEFXUw9I=", forHTTPHeaderField: "Api-Key")
        request.setValue("AtS1aPFxlIdVLth6ee2SEETlRxk=", forHTTPHeaderField: "Alias-Key")
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            let decoder = JSONDecoder()
            let value = try? decoder.decode(Categories.self, from: data!)
            self.categories = value?.data
            if let value = value {
                completion(value.data)
            }
        }
        task.resume()
    }
    
}



