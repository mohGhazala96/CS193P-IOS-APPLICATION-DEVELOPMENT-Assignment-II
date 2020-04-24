//
//  Card.swift
//  Set
//
//  Created by Mohamed Aboughazala on 4/24/20.
//  Copyright © 2020 Mohamed Aboughazala. All rights reserved.
//

import Foundation
struct  Card :Hashable  {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool{
        return lhs.identifier == rhs.identifier
    }
    
    private var identifier:Int
    static var idenitifierFactory = 0
    private(set) var shapeText:String
    private(set) var color:colors
    private(set) var shade:shading
    private(set) var numberOfSymbols: Int
    
    static func getUniqueIdentifier() ->Int{
        idenitifierFactory+=1
        return idenitifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
        color = colors.allCases.randomElement()!
        shade = shading.allCases.randomElement()!
        let shape = shapes.allCases.randomElement()!
        numberOfSymbols = Int.random(in: 1 ... 3)
        
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
