//
//  Concentration.swift
//  Concentration
//
//  Created by Alex Kholodov on 26.12.2017.
//  Copyright © 2017 Alex Kholodov. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex : Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set (newValue) {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        if let machIndex = indexOfOneAndOnlyFaceUpCard, machIndex != index {
            // check if card match
            if cards[machIndex].identifier == cards[index].identifier {
                cards[machIndex].isMatched = true
                cards[index].isMatched = true // карты совпали
            }
            cards[index].isFaceUp = true
            indexOfOneAndOnlyFaceUpCard = nil
        } else {
            // either no cards or 2 cards are face up
            for flipdownIndex in cards.indices {
                cards[flipdownIndex].isFaceUp = false
            }
            cards[index].isFaceUp = true
            indexOfOneAndOnlyFaceUpCard = index
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        //TODO: Shuffle the card (перетосовать карты) -> H.W.
//        var value = ""
//        for i in cards {
//            value += String(i.identifier) + " "
//        }
//        print(value)
//        value = ""
        
        for i in 1..<cards.count {
            let randomIndex = Int(arc4random_uniform(UInt32(cards.count - i + 1)))
//            value += String(randomIndex) + " "
            let oldValueOfCardsIdentifier = cards[i].identifier
            cards[i].identifier = cards[randomIndex].identifier
            cards[randomIndex].identifier = oldValueOfCardsIdentifier
        }
//        print(value)
//
//        value = ""
//        for i in cards {
//            value += String(i.identifier) + " "
//        }
//        print(value)

    }
}
