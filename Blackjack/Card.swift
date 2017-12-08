//
//  Card.swift
//  Blackjack
//
//  Created by Aaron Mooney on 03/12/2017.
//  Copyright © 2017 Aaron Mooney. All rights reserved.
//

import Foundation
import SpriteKit

/*
 Card class, initializes a card with a suit and value and adds the relevent sprite
 */

class Card:SKSpriteNode {
    private var suit:String = ""
    private var value:Int = 0
    
    init(suit: String, value: Int){
        self.suit = suit
        self.value = value
        let texture = SKTexture(imageNamed: suit + String(value))
        super.init(texture: texture, color: SKColor.clear, size: texture.size())
    }
    
    func getValue()->Int{
        return value
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
