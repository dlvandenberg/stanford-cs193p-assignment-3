//
//  Deck.swift
//  Set
//
//  Created by Dennis van den Berg on 06/05/2023.
//

import Foundation

struct Deck: SetDeck {
    var cards: Set<Card>
    
    init() {
        cards = Set(Deck.generateCards())
    }
}
