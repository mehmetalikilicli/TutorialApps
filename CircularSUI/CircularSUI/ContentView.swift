//
//  ContentView.swift
//  CircularSUI
//
//  Created by Mehmet Ali Kılıçlı on 7.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var firstCircularPercentage : Double = 0
    @State var secondCircularPercentage : Double = 0
    @State var thirdCircularPercentage : Double = 0

    
    var body: some View {
        ZStack {
            Circular(lineWidth: 40, backgroundColor: Color.blue.opacity(0.2), foregroundColor: Color.blue, persentage: firstCircularPercentage, clockwise: false)
                .frame(width: 420, height: 420)
                .onTapGesture {
                    if self.firstCircularPercentage == 0 {
                        self.firstCircularPercentage = 80
                    } else {
                        self.firstCircularPercentage = 0
                    }
                }
            
            Circular(lineWidth: 40, backgroundColor: Color.red.opacity(0.1), foregroundColor: Color.red, persentage: secondCircularPercentage, clockwise: true)
                .frame(width: 320, height: 320)
                .onTapGesture {
                    if self.secondCircularPercentage == 0 {
                        self.secondCircularPercentage = 30
                    } else {
                        self.secondCircularPercentage = 0
                    }
                }
            
            Circular(lineWidth: 40, backgroundColor: Color.green.opacity(0.2), foregroundColor: Color.green, persentage: thirdCircularPercentage, clockwise: false)
                .frame(width: 220, height: 220)
                .onTapGesture {
                    if self.thirdCircularPercentage == 0 {
                        self.thirdCircularPercentage = 90
                    } else {
                        self.thirdCircularPercentage = 0
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
