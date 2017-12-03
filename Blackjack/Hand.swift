//
//  Hand.swift
//  Blackjack
//
//  Created by Aaron Mooney on 03/12/2017.
//  Copyright © 2017 Aaron Mooney. All rights reserved.
//

import Foundation

class Hand{
    private var hand = [Card]()
    
    func addCard(card: Card){
        hand.append(card)
    }
    
    func reset(){
        hand.removeAll()
    }
    
    func getValue()->Int{
        var total = 0;
        var hasAce=false
        
        for card in hand{
            var cardValue = card.getValue()
            if (cardValue > 10){
                cardValue = 10
            }
            
            total += cardValue
            
            if (cardValue == 1){
                hasAce = true;
            }
        }
        
        if (hasAce && total <= 11){
            total += 10
        }
        return total
    }
    
    func getLength()-> Int{
        return hand.count
    }
}
