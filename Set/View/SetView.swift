//
//  ContentView.swift
//  Set
//
//  Created by Dennis van den Berg on 01/05/2023.
//

import SwiftUI

struct SetView: View {
    @ObservedObject var game: SetViewModel
    
    var body: some View {
        ZStack {
            gameBackground
            
            VStack {
                TopBarView(score: game.score, hintsRemaining: game.availableHints, showHint: game.showHint)
                
                AspectVGrid(items: game.cards, aspectRatio: DrawingConstants.cardAspectRation) { card in
                    CardView(card)
                        .padding(DrawingConstants.cardSpacing)
                        .onTapGesture {
                            game.select(card)
                        }
                }
                .padding(5)
                
                ActionBarView(canDeal: game.canDeal, deal: game.deal, newGame: game.newGame)
            }
        }
        
    }
    
    var gameBackground: some View {
        Rectangle()
            .fill(.gray)
            .opacity(0.4)
            .edgesIgnoringSafeArea(.all)
    }
    
    private struct DrawingConstants {
        static let cardSpacing: CGFloat = 2
        static let cardAspectRation: CGFloat = 2/3
        static let cardMinWidth: CGFloat = 40
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetViewModel()
        SetView(game: game)
    }
}
