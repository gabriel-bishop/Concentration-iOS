//
//  Card.swift
//  Concentration
//
//  Created by Gabriel Bishop on 5/2/19.
//  Copyright © 2019 Gabriel Bishop. All rights reserved.
//

import Foundation

// in Swift, structs have no inheritance
// && structs are value types (classes are reference types)

// When you assign, pass, it COPIES the value vs keeping the same one
// arrays, strings, dictionaries, ints are STRUCTS
struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    // NO EMOJI! MODEL IS UI-INDEPENDENT
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifer() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifer()
    }
}
