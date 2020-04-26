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
    
    func evaluateFeatures(_ v1:  Int, _ v2: Int, _ v3: Int) -> Bool {
        return (v1==v2 && v1==v3) || ((v1 != v2) && (v1 != v3) && (v2 != v3))
    }
    
    func doSelectedCardsMatch() -> Bool {
        
        // all three dirrenet/same shapes
        let evalShapes = evaluateFeatures(selectedCards[0].shape.hashValue, selectedCards[1].shape.hashValue,selectedCards[2].shape.hashValue)

        // all three dirrenet/same shade
        let evalShades = evaluateFeatures(selectedCards[0].shade.hashValue, selectedCards[1].shade.hashValue,selectedCards[2].shade.hashValue)
        
        // all three dirrenet/same color
        let evalColor = evaluateFeatures(selectedCards[0].color.hashValue, selectedCards[1].color.hashValue,selectedCards[2].color.hashValue)

        // all three dirrenet/same number
        let evalNumber = evaluateFeatures(selectedCards[0].numberOfSymbols.hashValue, selectedCards[1].numberOfSymbols.hashValue,selectedCards[2].numberOfSymbols.hashValue)

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
