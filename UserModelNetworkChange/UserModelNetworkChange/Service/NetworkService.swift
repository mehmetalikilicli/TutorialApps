//
//  NetworkService.swift
//  UserModelNetworkChange
//
//  Created by Mehmet Ali Kılıçlı on 7.09.2022.
//

import Foundation

protocol NetworkService {
    func download(_ resource: String) async throws -> [User]
    var type : String { get }
}
