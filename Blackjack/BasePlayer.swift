//
//  BasePlayer.swift
//  Blackjack
//
//  Created by Aaron Mooney on 03/12/2017.
//  Copyright © 2017 Aaron Mooney. All rights reserved.
//

import Foundation

/*
 Player and dealer superclass
 */

class BasePlayer{
    var hand:Hand
    
    
    init(hand:Hand){
        self.hand = hand
    }
}
