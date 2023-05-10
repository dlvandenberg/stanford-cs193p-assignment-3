//
//  SetViewModel.swift
//  Set
//
//  Created by Dennis van den Berg on 02/05/2023.
//

import SwiftUI

class SetViewModel: ObservableObject {
    @Published private var model = SetGame(deck: Deck())
    
    // MARK: Available to Views
    var cards: [SetCardViewModel] {
        model.cards.map(SetCardViewModel.init)
    }
    
    var canDeal: Bool {
        model.canDeal
    }
    
    var score: Int {
        model.score
    }
    
    var availableHints: Int {
        model.hintsLeft
    }
    
    var isFinised: Bool {
        model.isFinised
    }
    
    // MARK: Intents
    func select(_ card: SetCardViewModel) {
        if let cardIndex = model.cards.firstIndex(where: { $0.id == card.id }) {
            model.chooseCard(at: cardIndex)
        } else {
            print("No index")
        }
    }
    
    func deal() {
        if model.canDeal {
            model.deal()
        }
    }
    
    func newGame() {
        model = SetGame(deck: Deck())
    }
    
    func showHint() {
        model.markPossibleSetInCards()
    }
}
