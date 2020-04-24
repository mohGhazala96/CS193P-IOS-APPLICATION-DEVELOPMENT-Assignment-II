//
//  ViewController.swift
//  Set
//
//  Created by Mohamed Aboughazala on 4/24/20.
//  Copyright © 2020 Mohamed Aboughazala. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var toBeDealtCards: [CardButton]!
    @IBOutlet var onScreenCards: [CardButton]!
    @IBOutlet weak var scoreLabel: UILabel!
    var game = SetGamePlay()
    @IBAction func dealCards(_ sender: UIButton) {
        
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        
    }
    
    @IBAction func touchCard(_ sender: CardButton) {
        sender.toggleButtonSelection()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let allButtons = onScreenCards+toBeDealtCards
        
        for index in allButtons.indices{
            let button = allButtons[index]
            let card = game.cards[index]
            button.setTitleForCard(chosenColor: card.color, shading: card.shade, text: card.shapeText)
            if(toBeDealtCards.contains(button)){
                button.isEnabled = false
                button.isHidden = true
            }

        }
    }
    
    
}

