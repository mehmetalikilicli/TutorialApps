//
//  ContentView.swift
//  JokesAppSwiftUI
//
//  Created by Mehmet Ali Kılıçlı on 6.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var jokesVM = JokesViewModel()

    
    var body: some View {
        
        NavigationView {
            
            List(jokesVM.jokes) { element in
                Text(element.joke)
            }
            .toolbar {
                Button(action: addJoke) {
                    Text("Get New Joke")
                }
            }
            .navigationBarTitle("Jokes App")
        }
    }
    func addJoke() {
        jokesVM.getJokes(count: 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
