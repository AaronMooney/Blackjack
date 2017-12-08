//
//  Bet.swift
//  Blackjack
//
//  Created by Aaron Mooney on 03/12/2017.
//  Copyright © 2017 Aaron Mooney. All rights reserved.
//

import Foundation
class Bet{
    
    /*
     Class that stores the current bet and allows for is to be added to, doubled or cleared
     */
    
    private var bet = 0
    
    
    func addBet(amount: Int){
        bet += amount
    }
    
    func getBet()->Int{
        return bet
    }
    
    func doubleBet(){
        bet = bet * 2
    }
    func clearBet(){
        bet = 0
    }
}
