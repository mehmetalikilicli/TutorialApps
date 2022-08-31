//
//  UserSingleton.swift
//  SnapchatClone
//
//  Created by Mehmet Ali Kılıçlı on 31.08.2022.
//

import Foundation
 
class UserSingleton {
    static let sharedUserInfo = UserSingleton()
    
    var email = ""
    var username = ""
    
    private init() {
        
    }
}
