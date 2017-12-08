//
//  GameViewController.swift
//  Blackjack
//
//  Created by Aaron Mooney on 03/12/2017.
//  Copyright © 2017 Aaron Mooney. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = GameScene(size:CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        let view = self.view as! SKView
        
        view.showsFPS = false
        view.showsNodeCount = false
        view.ignoresSiblingOrder = false
        scene.scaleMode = .aspectFill
        view.presentScene(scene)
        
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
