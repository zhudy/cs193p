//
//  Concentration.swift
//  cs193p
//
//  Created by mac mini on 2019/9/15.
//  Copyright © 2019 mac mini. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }else{
                //either no cards or 2 cards are face up
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index                
            }
        }

    }
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        //todo: Shuffle the cards
        shuffle()
    }
    
    func shuffle() {
        for _ in 0...40{ //shuffle 20 time
            let randomIndex_a = Int(arc4random_uniform(UInt32(cards.count)))
            let randomIndex_b = Int(arc4random_uniform(UInt32(cards.count)))
            let card = cards[randomIndex_a]
            cards[randomIndex_a] = cards[randomIndex_b]
            cards[randomIndex_b] = card
        }
    }
    
    func replay(){
        //turn all cards to unmatched
        for i in 0..<cards.count {
            cards[i].isMatched = false
            cards[i].isFaceUp = false
        }
        shuffle()
    }
}
