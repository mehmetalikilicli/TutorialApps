//
//  Circular.swift
//  CircularSUI
//
//  Created by Mehmet Ali Kılıçlı on 7.09.2022.
//

import SwiftUI

struct Circular: View {
    
    let lineWidth : CFloat
    let backgroundColor : Color
    let foregroundColor : Color
    let persentage: Double
    let clockwise : Bool
    
    
    var body: some View {
        GeometryReader {geometry in
            ZStack {
                CircularShape()
                    .stroke(style: StrokeStyle(lineWidth: CGFloat(lineWidth)))
                    .fill(backgroundColor)
                
                CircularShape(percentage: persentage, clockwise: clockwise)
                    .stroke(style: StrokeStyle(lineWidth: CGFloat(lineWidth)))
                    .fill(foregroundColor)
                
            }.animation(.easeIn(duration: 1.0), value: persentage)
            .padding(CGFloat(lineWidth)/1.5)
        }
        
    }
}

struct Circular_Previews: PreviewProvider {
    static var previews: some View {
        Circular(lineWidth: 10, backgroundColor: .red, foregroundColor: .green, persentage: 50, clockwise: false)
    }
}
