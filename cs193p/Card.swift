//
//  Card.swift
//  cs193p
//
//  Created by mac mini on 2019/9/15.
//  Copyright © 2019 mac mini. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    static func getUniqeIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }

    init(){
        self.identifier = Card.getUniqeIdentifier()
    }
}
