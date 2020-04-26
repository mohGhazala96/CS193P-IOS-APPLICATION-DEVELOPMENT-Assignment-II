//
//  SetGamePlay.swift
//  Set
//
//  Created by Mohamed Aboughazala on 4/24/20.
//  Copyright © 2020 Mohamed Aboughazala. All rights reserved.
//

import Foundation
class SetGamePlay {
    
    var selectedCards = [Card]()
    var generatedCards = [Card]()
    private var score = 0
    
    func generateCard() -> Card{
        let card = Card()
        generatedCards.append(card)
        return card
    }
    
    func addSelectedCard(_ card:Card){
        selectedCards.append(card)
    }
    func areSelectedCardsFull() -> Bool{
        return selectedCards.count == 3
    }
    
    func updateScore() -> Int {
        if self.doSelectedCardsMatch(){
            score += 3
        }else{
            score -= 1
        }
        return score
    }
    
    func evaluateShapes(_ v1:  Card.shapes, _ v2: Card.shapes, _ v3: Card.shapes) -> Bool {
        return (v1==v2 && v1==v3) || ((v1 != v2) && (v1 != v3) && (v2 != v3))
    }
    
    func evaluateShades(_ v1:  Card.shading, _ v2: Card.shading, _ v3: Card.shading) -> Bool {
        return (v1==v2 && v1==v3) || ((v1 != v2) && (v1 != v3) && (v2 != v3))
    }
    
    func evaluateColor(_ v1:  Card.colors, _ v2: Card.colors, _ v3: Card.colors) -> Bool {
        return (v1==v2 && v1==v3) || ((v1 != v2) && (v1 != v3) && (v2 != v3))
    }
    
    func evaluateNumberOfSymbols(_ v1:  Int, _ v2: Int, _ v3: Int) -> Bool {
        return (v1==v2 && v1==v3) || ((v1 != v2) && (v1 != v3) && (v2 != v3))
    }
    
    func doSelectedCardsMatch() -> Bool {
        
        // all three dirrenet/same shapes
        let evalShapes = evaluateShapes(selectedCards[0].shape, selectedCards[1].shape,selectedCards[2].shape)

        // all three dirrenet/same shade
        let evalShades = evaluateShades(selectedCards[0].shade, selectedCards[1].shade,selectedCards[2].shade)
        
        // all three dirrenet/same color
        let evalColor = evaluateColor(selectedCards[0].color, selectedCards[1].color,selectedCards[2].color)

        // all three dirrenet/same number
        let evalNumber = evaluateNumberOfSymbols(selectedCards[0].numberOfSymbols, selectedCards[1].numberOfSymbols,selectedCards[2].numberOfSymbols)

        return evalShapes && evalShades && evalColor && evalNumber
    }
    func resetSelectedCards (){
        selectedCards = []
    }
    func resetAllCards(){
        score = 0
        generatedCards = []
    }
    
    func removeSelectedCard(_ card:Card){
        selectedCards.removeAll{ $0 == card }
    }
}
