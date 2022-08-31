//
//  ContentView.swift
//  FavoriteBook
//
//  Created by Mehmet Ali Kılıçlı on 26.08.2022.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
            
        ForEach(myFavorites) {favorite in
            Section(header: Text(favorite.title)) {
                ForEach(favorite.elements) {element in
                    Text(element.name)
                }
            }
        }
        
    }

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
