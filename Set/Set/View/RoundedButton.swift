//
//  RoundedButton.swift
//  Set
//
//  Created by Mohamed Aboughazala on 4/26/20.
//  Copyright © 2020 Mohamed Aboughazala. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {
    override init(frame: CGRect) {
          super.init(frame: frame)
          initialSetup()
      }
      
      required init?(coder aDecoder: NSCoder) {
          super.init(coder: aDecoder)
          initialSetup()
      }
      
      private func initialSetup() {
          layer.cornerRadius = frame.width * 0.15
          layer.backgroundColor = #colorLiteral(red: 0.9568073153, green: 0.9511192441, blue: 0.9611795545, alpha: 1)
      }
}
