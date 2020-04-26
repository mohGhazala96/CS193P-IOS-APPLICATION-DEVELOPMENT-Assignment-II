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
    var allButtons = [CardButton]()
    @IBOutlet weak var scoreLabel: UILabel!
    var selectedButtons: [CardButton] = []
    var game = SetGamePlay()
    
    @IBAction func dealCards(_ sender: UIButton) {
        var count = 0
        for button in toBeDealtCards where count < 3 {
            if !button.isEnabled{
                button.isEnabled = true
                button.isHidden = false
                count+=1
            }
        }
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        addCards()
        selectedButtons = [CardButton]()
    }
    
    @IBAction func touchCard(_ sender: CardButton) {
        sender.toggleButtonSelection()
        //        sleep(1)
        
        let index = allButtons.firstIndex(of: sender)!
        if sender.buttonIsSelected{
            game.addSelectedCard(game.generatedCards[index])
            
            // checks if the numbers of selected cards are three
            if game.areSelectedCardsFull() {
                selectedButtons.append(sender)
                scoreLabel.text = "Score:\(game.updateScore())"
                // updates the 3 selected cards with new cards if they match
                if game.doSelectedCardsMatch() {
                    resetSelectedCards()
                }
                toggleOffSelctedButtons()
                game.resetSelectedCards()
                selectedButtons = []
            }else{
                selectedButtons.append(sender)
            }
        }else{
            game.removeSelectedCard(game.generatedCards[index])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allButtons = onScreenCards+toBeDealtCards
        addCards()
        selectedButtons = [CardButton]()
        
    }
    
    func resetSelectedCards(){
        for index in allButtons.indices{
            let button = allButtons[index]
            if button.buttonIsSelected {
                game.generatedCards[index] = Card()
                let card = game.generatedCards[index]
                button.setTitleForCard(chosenColor: card.color, shading: card.shade, text: card.shapeText)
            }
        }
    }
    
    func toggleOffSelctedButtons() {
        for button in selectedButtons{
            button.buttonIsSelected = false
        }
    }
    
    func addCards(){
        game.resetAllCards()
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

