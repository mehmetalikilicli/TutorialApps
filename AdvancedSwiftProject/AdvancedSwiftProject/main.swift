//
//  main.swift
//  AdvancedSwiftProject
//
//  Created by Mehmet Ali Kılıçlı on 26.08.2022.
//

import Foundation

print("Hello, World!")

 let classJames = MusicianClass(nameInput: "James", ageInput: 50, instrumentInput: "Guitar")

print(classJames.name)

let structJames = MusicianStruct(name: "James", age: 50, instrument: "Guitar")

print(structJames.name)

let myTuple = (10,[10,20,30])

print(myTuple.1[1])
