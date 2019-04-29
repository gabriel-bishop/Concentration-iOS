//
//  ViewController.swift
//  Concentration
//
//  Created by Gabriel Bishop on 4/29/19.
//  Copyright © 2019 Gabriel Bishop. All rights reserved.
//

import UIKit
// we're inheriting UIVewController into our view controller
class ViewController: UIViewController {
    
    var emojiChoices = ["👌", "🐶", "👌", "🐶"]
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    // connected to the Label on UI
    // exclamation is important...doesn't require initialization
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        
        // returns Int? (optional)...
        // optional has 2 states, set or not
        // nil means not set state of optional
        // With exclam on 35, can assume all optionals are set
        // let cardNumber = cardButtons.firstIndex(of: sender)!
        
        if let cardNumber = cardButtons.firstIndex(of: sender){
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        } else {
            print("Can't find your card number")
        }
    }
    
    // When someone calls function, it should read like english
    func flipCard(withEmoji emoji: String, on button: UIButton){
        
        // print("Flipping card with: \(emoji)")
        
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        
    }
    
    

    
}

