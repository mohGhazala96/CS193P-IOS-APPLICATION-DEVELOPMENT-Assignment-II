//
//  ViewController.swift
//  Set
//
//  Created by Mohamed Aboughazala on 4/24/20.
//  Copyright © 2020 Mohamed Aboughazala. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var toBeDealtCards: [UIButton]!
    @IBOutlet var onScreenCards: [UIButton]!
    @IBOutlet weak var scoreLabel: UILabel!
    var game = SetGamePlay()
    @IBAction func dealCards(_ sender: UIButton) {
        
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        
    }
    
    @IBAction func touchCard(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let allButtons = onScreenCards+toBeDealtCards
        
        for index in allButtons.indices{
            let button = allButtons[index]
            let cardTitle = game.cards[index].shapeText
            button.setTitle(cardTitle, for: UIControl.State.normal)
            if(toBeDealtCards.contains(button)){
                button.isEnabled = false
                button.isHidden = true
            }

        }
    }
    
    
}

