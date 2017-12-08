//
//  Player.swift
//  Blackjack
//
//  Created by Aaron Mooney on 03/12/2017.
//  Copyright © 2017 Aaron Mooney. All rights reserved.
//

import Foundation

/*
 Player class that holds their balance and whether they are standing or can bet
 */

class Player: BasePlayer{
    var balance:Balance
    private var stand = false
    private var canBet = false
    
    init(hand: Hand, balance: Balance){
        self.balance = balance
        super.init(hand: hand)
    }
    
    func setCanBet(canBet: Bool){
        self.canBet = canBet
    }
    
    func getCanBet()->Bool{
        return canBet
    }
    
    func isStanding()->Bool{
        return stand
    }
    
    func setStand(stand: Bool){
        self.stand = stand
    }
}
