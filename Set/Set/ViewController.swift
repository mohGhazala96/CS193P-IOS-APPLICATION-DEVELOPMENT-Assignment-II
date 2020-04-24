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
        var count = 0

        for index in toBeDealtCards.indices where count < 3 {
            let button = toBeDealtCards[index]
            if !button.isEnabled{
                let card = game.generateCard()
                button.setTitleForCard(chosenColor: card.color, shading: card.shade, text: card.shapeText)
                button.isEnabled = true
                button.isHidden = false
                count+=1
            }
        }
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        addCards()
    }
    
    @IBAction func touchCard(_ sender: CardButton) {
        let allButtons = onScreenCards+toBeDealtCards
        sender.toggleButtonSelection()
        let index = allButtons.firstIndex(of: sender)!
        print(index)
        if sender.buttonIsSelected{
            if game.addSelectedCard(game.generatedCards[index]) {
                scoreLabel.text = "Score:\(game.updateScore())"
                // reset UI accordingly
                
            }
        }else{
            game.removeSelectedCard(game.generatedCards[index])
        }
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        addCards()
    }

    func addCards(){

        let allButtons = onScreenCards+toBeDealtCards
        for index in allButtons.indices{
            let button = allButtons[index]
            let card = game.generateCard()
            button.setTitleForCard(chosenColor: card.color, shading: card.shade, text: card.shapeText)
            if(toBeDealtCards.contains(button)){
                button.isEnabled = false
                button.isHidden = true
            }

        }
    }
    
}

