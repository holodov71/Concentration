//
//  Card.swift
//  Concentration
//
//  Created by Alex Kholodov on 26.12.2017.
//  Copyright © 2017 Alex Kholodov. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactiry = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactiry += 1
        return identifierFactiry
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
