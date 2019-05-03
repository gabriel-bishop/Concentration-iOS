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
    
    // uninitialized until someone tries using it
    // cannot have a didSet{} (no property observers)
    lazy var game = Concentration(numberOfPairsOfCards: cardButtons.count + 1 / 2)
    
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
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Can't find your card number")
        }
    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0) : #colorLiteral(red: 0, green: 0.6662307382, blue: 0.7491201758, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["👌", "🐶", "🍰", "🍩", "🍪", "🎤", "🎸", "🎮"]
    
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
        // if it's nil, return the ?
    }
    
}

