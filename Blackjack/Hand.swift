//
//  Hand.swift
//  Blackjack
//
//  Created by Aaron Mooney on 03/12/2017.
//  Copyright © 2017 Aaron Mooney. All rights reserved.
//

import Foundation

/*
 Class for a players hand
 Can add a card to a hand, clear the hand, return how many cards a player is holding and return the total value of the hand
 */

class Hand{
    public var hand = [Card]()
    public var hasAce = false
    
    func addCard(card: Card){
        hand.append(card)
    }
    
    func reset(){
        hand.removeAll()
    }
    
    func getValue()->Int{
        var total = 0;
        hasAce = false
        
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
    
    func getValueExceptHidden()->Int{
        var total = 0;
        hasAce = false
        
        //skip the first card in the hand in case of dealers face down card
        for (index,element) in hand.enumerated(){
            if (index == 0) {continue}
            var cardValue = element.getValue()
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
