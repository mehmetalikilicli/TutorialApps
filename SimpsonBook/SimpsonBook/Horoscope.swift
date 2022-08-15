//
//  Horoscope.swift
//  SimpsonBook
//
//  Created by Mehmet Ali Kılıçlı on 15.08.2022.
//

import Foundation
import UIKit


class Horoscope {
    
    var name : String
    var properties : String
    var image : UIImage
    
    init(horoscopreName: String, horoscopeProperties: String, horoscopeImage: UIImage){
        name = horoscopreName
        properties = horoscopeProperties
        image = horoscopeImage
            
        
    }
    
}
