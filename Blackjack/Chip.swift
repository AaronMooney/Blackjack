//
//  Chip.swift
//  Blackjack
//
//  Created by Aaron Mooney on 03/12/2017.
//  Copyright © 2017 Aaron Mooney. All rights reserved.
//

import Foundation
import SpriteKit

/*
 Class for a money chip that has a corresponding cash value
 */

enum ChipValue: Int{
    case one = 1
    case five = 5
    case ten = 10
    case twentyFive = 25
    case fifty = 50
    case oneHundred = 100
    case fiveHundred = 500
}

class Chip:SKSpriteNode{
    
    private var chipValue = ChipValue.one
    init(chipValue: ChipValue){
        var texture:SKTexture
        self.chipValue = chipValue
        
        switch chipValue{
        case .one:
            texture = SKTexture(imageNamed: "chip1")
        case .five:
            texture = SKTexture(imageNamed: "chip5")
        case .ten:
            texture = SKTexture(imageNamed: "chip10")
        case .twentyFive:
            texture = SKTexture(imageNamed: "chip25")
        case .fifty:
            texture = SKTexture(imageNamed: "chip50")
        case .oneHundred:
            texture = SKTexture(imageNamed: "chip100")
        case .fiveHundred:
            texture = SKTexture(imageNamed: "chip500")
        }
        super.init(texture: texture, color:SKColor.clear, size: texture.size())
        self.name = "chip"
    }
    
    func getValue()->ChipValue{
        return chipValue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
