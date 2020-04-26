//
//  CardButton.swift
//  Set
//
//  Created by Ruben on 12/7/17.
//  Copyright © 2017 Ruben. All rights reserved.
//
import UIKit


class CardButton: RoundedButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func toggleButtonSelection() {
        buttonIsSelected = !buttonIsSelected
    }
    
    var buttonIsSelected: Bool {
        get {
            return layer.borderColor == #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        }
        set {
            if newValue == true {
                layer.borderWidth = 2.0
                layer.borderColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            }
            else {
                layer.borderWidth = 0.0
                layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
            }
        }
    }
    
    func setTitleForCard(chosenColor: Card.colors ,shading: Card.shading,text: String)  {
        var color: UIColor
        switch chosenColor {
        case .purple: color = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        case .red: color = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        case .green: color = #colorLiteral(red: 0.03970472395, green: 0.8106054687, blue: 0, alpha: 1)
        }
        
        var filled: Bool
        switch shading {
        // outlined
        case .outlined: filled = false; color = color.withAlphaComponent(1.0)
        // faded
        case .faded: filled = true; color = color.withAlphaComponent(0.3)
        // Filled
        case .filled: filled = true; color = color.withAlphaComponent(1.0)
        }
        
        let attributes: [NSAttributedString.Key:Any] = [
            .strokeWidth : 1.0 * (filled ? -1.0 : 4.0),
            .foregroundColor : color,
        ]
        
        let attributedString = NSAttributedString(string: text, attributes: attributes)
        setAttributedTitle(attributedString, for: .normal)

    }
}
