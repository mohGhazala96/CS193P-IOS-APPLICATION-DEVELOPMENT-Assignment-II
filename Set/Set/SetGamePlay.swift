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

    func generateCard() -> Card{
        let card = Card()
        generatedCards.append(card)
        return card
    }
    
    func addSelectedCard(_ card:Card)-> Bool{
        selectedCards.append(card)
        return selectedCards.count == 3
    }
    
    func updateScore() -> Int {
        return self.doSelectedCardsMatch() == true ? 3 : -1
    }
    
    func doSelectedCardsMatch() -> Bool {
        return false
    }
    
    func removeSelectedCard(_ card:Card){
        selectedCards.removeAll{ $0 == card }
    }
}
