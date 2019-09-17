//
//  ViewController.swift
//  cs193p
//
//  Created by mac mini on 2019/9/14.
//  Copyright © 2019 mac mini. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    var flipCount: Int = 0 {
        didSet{
            flipCountLabel.text = "翻牌次数: \(flipCount)"
        }
    }

    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func repeatButton(_ sender: UIButton) {
        game.replay()
        flipCount = 0
        updateViewFromModel()
    }
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        let cardNumber = cardButtons.firstIndex(of: sender)!
        print("cardNumber = \(cardNumber)")
        
        game.chooseCard(at: cardNumber)
        updateViewFromModel()
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 0) : #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
            }
        }
    }
    
    var emojiChoices: Array<String> = ["🍭","🎃","🐶","🏀","🥌", "📞", "❤️", "🏴‍☠️", "🐷", "🚀", "＄", "🌶"]
    
    var emoji = [Int:String]()
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }

        return emoji[card.identifier] ?? "?"
    }
}
