//
//  Deck.swift
//  Blackjack
//
//  Created by Aaron Mooney on 03/12/2017.
//  Copyright © 2017 Aaron Mooney. All rights reserved.
//

import Foundation

/*
 Deck class that creates an array of cards and allows for retreival and shuffling
 */

class Deck{
    private var deck = [Card]()
    private var index = -1
    
    init(){
        makeDeck()
    }
    
    func makeDeck(){
        let suits = ["Hearts","Diamonds","Clubs","Spades"]
        
        for suit in suits{
            for value in 1...13{
                let temp = Card(suit: suit, value: value)
                deck.append(temp)
            }
        }
    }
    
    func getCard()->Card{
        index += 1
        return deck[index]
    }
    
    func shuffleDeck(){
        deck.shuffle()
    }
    
    func newDeck(){
        index = -1
        shuffleDeck()
    }
}
