//
//  Card.swift
//  Set
//
//  Created by Mohamed Aboughazala on 4/24/20.
//  Copyright © 2020 Mohamed Aboughazala. All rights reserved.
//

import Foundation
struct  Card {
    private(set) var shapeText:String
    private(set) var color:colors
    private(set) var shade:shading
    private(set) var numberOfSymbols: Int
    
    init() {
        color = colors.allCases.randomElement()!
        shade = shading.allCases.randomElement()!
        numberOfSymbols = Int.random(in: 1 ... 3)
        
        let shape = shapes.allCases.randomElement()!
        switch shape {
        case .circle:
            shapeText = String(repeating: "●", count:numberOfSymbols )
        case .traingle:
            shapeText = String(repeating: "▲", count:numberOfSymbols )
        case .square:
            shapeText = String(repeating: "■", count:numberOfSymbols)
        }
        
    }
    
}

enum shapes: CaseIterable{
    case traingle
    case square
    case circle
}

enum colors: CaseIterable{
    case red
    case purple
    case green
}

enum shading: CaseIterable{
    case outlined
    case filled
    case faded
}
