//
//  JokesData.swift
//  JokesAppSwiftUI
//
//  Created by Mehmet Ali Kılıçlı on 6.09.2022.
//


//   let jokes = try? newJSONDecoder().decode(Jokes.self, from: jsonData)

import Foundation

// MARK: - Jokes
struct Jokes: Identifiable, Codable {
    let id = UUID()
    let type: String
    let value: [Value]
}

// MARK: - Values
struct Value: Identifiable, Codable {
    let id: Int
    let joke: String
    let categories: [String]
}
