//
//  Balance.swift
//  Blackjack
//
//  Created by Aaron Mooney on 03/12/2017.
//  Copyright © 2017 Aaron Mooney. All rights reserved.
//

import Foundation

/*
 Players bank balance
 */

class Balance {
    
    var amount = 500
    
    init(){}
    
    func reset(){
        amount = 500
    }
    
    func getBalance()->Int{
        return amount
    }
    
    
    func addCash(cash: Int){
        amount += cash
    }
    
    func subtractCash(cash: Int){
        amount -= cash
        if (amount <= 0){
            amount = 0
        }
    }
}
