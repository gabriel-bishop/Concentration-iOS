//
//  ConcentrationModel.swift
//  Concentration
//
//  Created by Gabriel Bishop on 5/2/19.
//  Copyright © 2019 Gabriel Bishop. All rights reserved.
//

import Foundation
import GameplayKit

class Concentration
{
    var cards = [Card]()
    var indexOfOnlyFaceUp: Int?
    // only relevant when there's ONLY one faceup
    
    init(numberOfPairsOfCards: Int){
        
        for _ in 0..<numberOfPairsOfCards{
            let card = Card()
//    This is possible because Card is a struct!
//            cards.append(card)
//            cards.append(card)
            cards += [card, card]
//             TODO: Learn to use todo
        }

//        for i in 1..<cards.count-1 {
//            cards.swapAt(1, i)
//            cards.swapAt(5, 9)
//            cards.swapAt(1, cards.count-3)
//            cards.swapAt(cards.count-1, 8)
//
//        }

        
        
//        for _ in 1...cards.count-3 {
//            var index = Int(arc4random_uniform(UInt32(cards.count)))
//            if index == cards.count {
//                index = index - 1
//            }
//            print(cards[index].identifier)
//            cards.swapAt(0, index)
//            print(cards[0].identifier)
//
//        }

    }
    
    func chooseCard(at index: Int){
        
        if !cards[index].isMatched {
            if let matchIndex = indexOfOnlyFaceUp, matchIndex != index {
                // check if they match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOnlyFaceUp = nil
            } else {
                // either no cards, or 2 are faceup
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOnlyFaceUp = index
            }
        }
    }
}
