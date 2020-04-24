//
//  SetGamePlay.swift
//  Set
//
//  Created by Mohamed Aboughazala on 4/24/20.
//  Copyright © 2020 Mohamed Aboughazala. All rights reserved.
//

import Foundation
class SetGamePlay {
    var cards:[Card] = [Card]()
    init() {
        for _ in 1...24{
            let card:Card = Card()
            cards.append(card)
        }
    }
}
