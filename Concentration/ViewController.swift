//
//  ViewController.swift
//  Concentration
//
//  Created by Alex Kholodov on 25.12.2017.
//  Copyright © 2017 Alex Kholodov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        return (cardButtons.count + 1) / 2
    }
    
    var flipCount = 0 { didSet { flipCountLabel.text = "Flips: \(flipCount)" } }
    
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        else {
            print("choosen card was not in cardButtons")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojoChoices = ["👩‍👩‍👧", "🧙🏽‍♂️", "🧞‍♀️", "🧛‍♂️", "🐺", "😱", "👻", "🎃", "🎅"]
    
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojoChoices.count > 0 {
            let randomindex = Int(arc4random_uniform(UInt32(emojoChoices.count)))
            emoji[card.identifier] = emojoChoices.remove(at: randomindex)
        }
        return emoji[card.identifier] ?? "?"
    }

}














