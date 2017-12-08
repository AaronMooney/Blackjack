//
//  GameScene.swift
//  Blackjack
//
//  Created by Aaron Mooney on 03/12/2017.
//  Copyright © 2017 Aaron Mooney. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    let chip1 = Chip(chipValue: .one)
    let chip5 = Chip(chipValue: .five)
    let chip10 = Chip(chipValue: .ten)
    let chip25 = Chip(chipValue: .twentyFive)
    let chip50 = Chip(chipValue: .fifty)
    let chip100 = Chip(chipValue: .oneHundred)
    let chip500 = Chip(chipValue: .fiveHundred)
    let dealButton = SKSpriteNode(imageNamed: "deal")
    let hitButton = SKSpriteNode(imageNamed: "hit")
    let standButton = SKSpriteNode(imageNamed: "stand")
    let doubleButton = SKSpriteNode(imageNamed: "double")
    let undoButton = SKSpriteNode(imageNamed: "undo")
    let human = Player(hand: Hand(),balance: Balance())
    let bet = Bet()
    let dealer = Dealer(hand: Hand())
    var cards = [Card]()
    var currentPlayer: BasePlayer = Player(hand: Hand(),balance: Balance())
    let deck = Deck()
    let betField = SKLabelNode(fontNamed: "arial")
    let balanceField = SKLabelNode(fontNamed: "arial")
    var dealing = false
    let gameText = SKLabelNode(fontNamed: "arial")
    var gameString = ""
    let dealerValue = SKLabelNode(fontNamed: "arial")
    let playerValue = SKLabelNode(fontNamed: "arial")
    var dealerTotal = ""
    
    
    
    override func didMove(to view: SKView) {
        
        buildTable()
        setupChips()
        setupButtons()
        currentPlayer = human
        
       
    }
    
    func buildTable(){
        let table = SKSpriteNode(imageNamed: "table")
        addChild(table)
        table.position = CGPoint(x: size.width/2, y: size.height/2)
        table.zPosition = -1
        betField.fontSize = 25
        betField.fontColor = SKColor.white
        betField.position = CGPoint(x: size.width/2 ,y: size.height/2 + 50)
        addChild(betField)
        
        
        balanceField.fontSize = 25
        balanceField.fontColor = SKColor.white
        balanceField.position = CGPoint(x: size.width - 100 ,y: size.height - 30)
        addChild(balanceField)
        
        gameText.fontSize = 25
        gameText.fontColor = SKColor.white
        gameText.position = CGPoint(x: size.width/2 ,y: size.height/2 + 80)
        addChild(gameText)
        
        playerValue.fontSize = 25
        playerValue.fontColor = SKColor.white
        playerValue.position = CGPoint(x: size.width/2 - 125, y: size.height/2 - 150 )
        addChild(playerValue)
        
        dealerValue.fontSize = 25
        dealerValue.fontColor = SKColor.white
        dealerValue.position = CGPoint(x: size.width/2 - 125, y: size.height/2 + 150 )
        addChild(dealerValue)
        
        deck.newDeck()
        
    }
    
    func setupButtons(){
        dealButton.name = "deal"
        addChild(dealButton)
        dealButton.position = CGPoint(x:size.width/2,y:size.height/2)
        
        hitButton.name = "hit"
        addChild(hitButton)
        hitButton.position = CGPoint(x:size.width * 0.25 - 25,y:size.height/2 - 300)
        hitButton.isHidden = true
        
        standButton.name = "stand"
        addChild(standButton)
        standButton.position = CGPoint(x:size.width * 0.75 + 25, y:size.height/2 - 300)
        standButton.isHidden = true
        
        doubleButton.name = "double"
        addChild(doubleButton)
        doubleButton.position = CGPoint(x:size.width/2, y:size.height/2 - 265)
        doubleButton.isHidden = true
        
        undoButton.name = "undo"
        addChild(undoButton)
        undoButton.position = CGPoint(x:betField.position.x - 125, y: betField.position.y + 10)
        undoButton.isHidden = true
    }
    
    func setupChips(){
        addChild(chip1)
        chip1.position = CGPoint(x:size.width/2 - 165,y:40)
        
        addChild(chip5)
        chip5.position = CGPoint(x:size.width/2 - 110,y:40)
        
        addChild(chip10)
        chip10.position = CGPoint(x:size.width/2 - 55,y:40)
        
        addChild(chip25)
        chip25.position = CGPoint(x:size.width/2,y:40)
        
        addChild(chip50)
        chip50.position = CGPoint(x:size.width/2 + 55,y:40)
        
        addChild(chip100)
        chip100.position = CGPoint(x:size.width/2 + 110,y:40)
        
        addChild(chip500)
        chip500.position = CGPoint(x:size.width/2 + 165,y:40)
    }
    
    func showChip()
    {
        if (human.balance.getBalance() >= chip1.getValue().rawValue){
            chip1.isHidden = false
        }
        
        if (human.balance.getBalance() >= chip5.getValue().rawValue){
            chip5.isHidden = false
        }
        
        if (human.balance.getBalance() >= chip10.getValue().rawValue){
            chip10.isHidden = false
        }
        
        if(human.balance.getBalance() >= chip25.getValue().rawValue){
            chip25.isHidden = false
        }
        
        if(human.balance.getBalance() >= chip50.getValue().rawValue){
            chip50.isHidden = false
        }
        
        if(human.balance.getBalance() >= chip100.getValue().rawValue){
            chip100.isHidden = false
        }
        
        if(human.balance.getBalance() >= chip500.getValue().rawValue){
            chip500.isHidden = false
        }
    }
    
    func deal(){
        dealButton.isHidden = true
        chip1.isHidden = true
        chip5.isHidden = true
        chip10.isHidden = true
        chip25.isHidden = true
        chip50.isHidden = true
        chip100.isHidden = true
        chip500.isHidden = true
        hitButton.isHidden = true
        standButton.isHidden = true
        undoButton.isHidden = true
        var count = 0
        
        let card = Card(suit: "back",value: 0)
        card.position = CGPoint(x:size.width/2 - 50, y:size.height - 50)
        addChild(card)
        card.zPosition = 1
        
        let newCard = deck.getCard()
        var pos = 0
        var hand = human.hand
        if(self.currentPlayer is Player){
            hand = human.hand
            pos = Int(size.height/2 - 100)
        } else {
            hand = dealer.hand
            pos = Int(size.height/2 + 200)
        }
        
        hand.addCard(card: newCard)
        let xPos = (Int)(size.width/2 - 50) + (hand.getLength()*35)
        let moveCard = SKAction.move(to: CGPoint(x:xPos,y:pos),duration: 1.0)
        card.run(moveCard,completion: {[unowned self] in self.human.setCanBet(canBet: true)
            count += 1
            self.dealing = true
            if (self.currentPlayer is Dealer && self.dealer.hand.getLength() == 1){
                self.dealer.setCard1(card: newCard)
                self.cards.append(card)
                card.zPosition = 0
            } else{
                card.removeFromParent()
                self.cards.append(newCard)
                self.addChild(newCard)
                newCard.position = CGPoint(x: xPos, y: pos)
                newCard.zPosition = 1
            }
            if (self.dealer.hand.getLength() < 2){
                if (self.currentPlayer is Player){
                    self.currentPlayer = self.dealer
                } else{
                    self.currentPlayer = self.human
                }
                self.deal()
            } else if (self.dealer.hand.getLength() == 2 && self.human.hand.getLength() == 2){
                if(self.human.hand.getValue() == 21 || self.dealer.hand.getValue() == 21){
                    self.gameOver(hasBlackJack: true)
                } else {
                    self.standButton.isHidden = false
                    self.hitButton.isHidden = false
                    self.doubleButton.isHidden = false
                }
            }
            if (self.dealer.hand.getLength() >=  3 && self.dealer.hand.getValue() < 17){
                self.deal()
            } else if (self.human.isStanding() && self.dealer.hand.getValue() >= 17){
                self.standButton.isHidden = true
                self.hitButton.isHidden = true
                self.doubleButton.isHidden = true
                self.gameOver(hasBlackJack: false)
            }
            if(self.human.hand.getValue() > 21){
                self.standButton.isHidden = true
                self.hitButton.isHidden = true
                self.doubleButton.isHidden = true
                self.gameOver(hasBlackJack: false)
            }
        })
        if (count > 2 && !dealing){
            hitButton.isHidden = false
            standButton.isHidden = false
        }
    }
    
    func gameOver(hasBlackJack: Bool){
        hitButton.isHidden = true
        standButton.isHidden = true
        let tempPos = cards[1].position
        let tempCard = dealer.getCard1()
        addChild(tempCard)
        cards.append(tempCard)
        tempCard.position = tempPos
        tempCard.zPosition = 0
        var winner:BasePlayer = human
        
        if(hasBlackJack){
            gameString = "Blackjack!"
            if(human.hand.getValue() > dealer.hand.getValue()){
                human.balance.addCash(cash: bet.getBet() * 3/2)
                moveCash(position: Int(size.height/2 - 100))
            } else{
                moveCash(position: Int(size.height/2 + 200))
            }
            dealButton.isHidden = false
            return
        }
        
        if (human.hand.getValue() > 21){
            gameString = "Dealer Wins!"
            winner = dealer
        } else if (dealer.hand.getValue() > 21){
            // dealer bust
            gameString = "Dealer Busts!"
            human.balance.addCash(cash: bet.getBet() * 2)
            winner = human
        } else if (dealer.hand.getValue() == human.hand.getValue()){
            // push
            gameString = "Push"
            human.balance.addCash(cash: bet.getBet())
            winner = human
        } else if (dealer.hand.getValue() < human.hand.getValue()){
            // player > dealer
            gameString = "You Win!"
            human.balance.addCash(cash: bet.getBet() * 2)
            winner = human
        } else if (dealer.hand.getValue() > human.hand.getValue()){
            //dealer wins
            gameString = "Dealer Wins!"
            winner = dealer
        }
        
        if (winner is Player){
            moveCash(position: Int(size.height/2 - 100))
            
        } else{
            moveCash(position: Int(size.height/2 + 200))
        }
        dealButton.isHidden = true
    }
    
    func moveCash(position: Int){
        let moveCash = SKAction.moveTo(y:CGFloat(position),duration: 2.0)
        betField.run(moveCash, completion: { [unowned self] in self.resetBetPos()})
    }
    
    func resetBetPos(){
        betField.removeAllChildren()
        betField.position = CGPoint(x: size.width/2 ,y: size.height/2 + 50)
        newGame()
    }
    
    func newGame(){
        currentPlayer = human
        deck.newDeck()
        showChip()
        human.hand.reset()
        dealer.hand.reset()
        human.setStand(stand: false)
        bet.clearBet()
        gameString = ""
        dealerTotal = ""
        playerValue.text = ""
        
        for card in cards{
            card.removeFromParent()
        }
        cards.removeAll()
        dealButton.isHidden = false
        
        if(human.balance.getBalance() <= 0){
            human.balance.addCash(cash: 600)
        }
    }
    
    func bet(betValue: ChipValue){
        if(betValue.rawValue > human.balance.getBalance()){
            print("You can't afford that bet")
            return
        } else{
            bet.addBet(amount: betValue.rawValue)
            human.balance.subtractCash(cash: betValue.rawValue)
        }
        betField.text = "$: " + String(bet.getBet())
    }
    
    func hit(){
        if (human.getCanBet()){
            currentPlayer = human
            deal()
            human.setCanBet(canBet: false)
        }
        standButton.isHidden = false
        hitButton.isHidden = false
    }
    
    func double(){
        if (human.getCanBet()){
            currentPlayer = human
            if (human.balance.getBalance() >= bet.getBet()){
                
                bet.doubleBet()
                human.balance.subtractCash(cash: bet.getBet()/2)
                deal()
                human.setCanBet(canBet: false)
            }
            standButton.isHidden = false
            hitButton.isHidden = false
        }
    }
    
    func stand(){
        human.setStand(stand: true)
        standButton.isHidden = true
        hitButton.isHidden = true
        doubleButton.isHidden = true
        if(dealer.hand.getValue() < 17){
            currentPlayer = dealer
            deal()
        } else {
            gameOver(hasBlackJack: false)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        balanceField.text = "Balance: $" + String(human.balance.getBalance())
        betField.text = "Bet: $" + String(bet.getBet())
        gameText.text = gameString
        dealerValue.text = dealerTotal
        
        if(human.hand.getLength() > 2){
            doubleButton.isHidden = true
        }
        
        if ( human.hand.getValue() > 0){
            playerValue.text = String(human.hand.getValue())
            if(human.hand.hasAce){
                playerValue.text = String(human.hand.getValue() - 10) + " / " + String(human.hand.getValue())
            }
        }
        if ( dealer.hand.getValue() > 0 && !human.isStanding()){
            dealerTotal = String(dealer.hand.getValueExceptHidden())
        }
        if (human.isStanding() || dealer.hand.getValue() == 21 || human.hand.getValue() > 21){
            dealerTotal = String(dealer.hand.getValue())
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let touch = touches.first else{
            return
        }
        
        let touchLocation = touch.location(in: self)
        let touchedNode = self.atPoint(touchLocation)
        
        if (touchedNode.name == "chip"){
            let chip = touchedNode as! Chip
            bet(betValue: chip.getValue())
            undoButton.isHidden = false
        }
        
        if (touchedNode.name == "deal") {
            undoButton.isHidden = true
            if (bet.getBet() > 0){
                gameString = ""
                deal()
            }
            else {
                gameString = "You must place a bet!"
            }
        }
        
        if (touchedNode.name == "hit") {hit()}
        
        if (touchedNode.name == "stand") {stand()}
        
        if (touchedNode.name == "double") {double()}
        
        if (touchedNode.name == "undo") {
            human.balance.addCash(cash: bet.getBet())
            bet.clearBet()
            undoButton.isHidden = true
        }

    }
}
