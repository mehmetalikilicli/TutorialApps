//
//  CircularShape.swift
//  CircularSUI
//
//  Created by Mehmet Ali Kılıçlı on 7.09.2022.
//

import SwiftUI
import Foundation

struct CircularShape: Shape {
    
    var percentage : Double
    var startAngle : Double
    var clockwise : Bool
    
    typealias AnimatableData = Double
    var animatableData: Double {
        get {
            return percentage
        }
        set {
            percentage = newValue
        }
    }
    
    init(percentage : Double = 100, startAngle : Double = -90, clockwise : Bool = false) {
        self.percentage = percentage
        self.startAngle = startAngle
        self.clockwise = clockwise
    }
    
    func path(in rect: CGRect) -> Path {
        
        let width = rect.width
        let height = rect.height
        let radius = min(width, height) / 2
        let center = CGPoint(x: width / 2, y: height / 2)
        let endAngle = (self.percentage / 100 * 360) + self.startAngle
        
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: Angle(degrees: startAngle), endAngle: Angle(degrees: endAngle),clockwise: clockwise)
        }
    }
    
    
    
    
    
    
}

