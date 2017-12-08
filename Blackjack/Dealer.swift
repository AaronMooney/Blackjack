//
//  Dealer.swift
//  Blackjack
//
//  Created by Aaron Mooney on 03/12/2017.
//  Copyright © 2017 Aaron Mooney. All rights reserved.
//

import Foundation

/*
 Dealer class
 */

class Dealer:BasePlayer{
    private var card1 = Card(suit: "back", value: 0)
    
    override init(hand: Hand){
        super.init(hand: hand)
    }
    
    func setCard1(card: Card){
        card1 = card
        
    }
    
    func getCard1()->Card{
        return card1
    }
}
