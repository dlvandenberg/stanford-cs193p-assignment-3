//
//  CardView.swift
//  Set
//
//  Created by Dennis van den Berg on 02/05/2023.
//

import SwiftUI

struct CardView: View {
    var card: SetCardViewModel
    
    init(_ card: SetCardViewModel) {
        self.card = card
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                CardBackground(card)
                
                let relativePadding = geometry.size.width * DrawingConstants.paddingFactor
                let relativeSpacing = geometry.size.width * DrawingConstants.spacingFactor
                VStack(spacing: relativeSpacing) {
                    ForEach(1...card.shapeCount, id: \.self) { _ in
                        ShapeView(shape: card.shape, color: card.color, shading: card.shading)
                    }
                }
                .padding(.horizontal, relativePadding)
            }
            .aspectRatio(DrawingConstants.cardAspectRatio, contentMode: .fit)
        }
    }
    
    struct CardBackground: View {
        var card: SetCardViewModel
        
        var cardInIncompleteSet: Bool {
            card.isSelected && !card.isMatched && !card.isMismatched
        }
        var cardInSet: Bool {
            card.isSelected
        }
        
        init(_ card: SetCardViewModel) {
            self.card = card
        }
        
        var body: some View {
            let cardShape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
            if card.isHint {
                cardShape.fill(.white).opacity(0.75)
                cardShape
                    .strokeBorder(.yellow, lineWidth: DrawingConstants.strokeWidth)
            } else {
                cardShape.fill(.white)
            }
            
            if cardInSet {
                if cardInIncompleteSet {
                    cardShape.strokeBorder(Color.teal, lineWidth: DrawingConstants.strokeWidth)
                } else {
                    cardShape.strokeBorder(card.isMatched ? Color.green : Color.red, lineWidth: DrawingConstants.strokeWidth)
                }
            }
        }
    }
    
    private struct DrawingConstants {
        static let paddingFactor: CGFloat = 0.10
        static let spacingFactor: CGFloat = 0.07
        static let cornerRadius: CGFloat = 10
        static let strokeWidth: CGFloat = 2.5
        static let cardAspectRatio: CGFloat = 2/3
    }
}

struct CardView_Previews: PreviewProvider {
    
    static var previews: some View {
            ZStack {
                Rectangle()
                    .ignoresSafeArea(.all)
                CardView(SetCardViewModel(Card(feature1: .squiggle, feature2: .green, feature3: .striped, feature4: .two)))
//                    .frame(width: 80)
            }
            
            ZStack {
                Rectangle()
                    .ignoresSafeArea(.all)
                CardView(SetCardViewModel(Card(feature1: .squiggle, feature2: .green, feature3: .striped, feature4: .three)))
                    .frame(width: 50)
            }
        
        ZStack {
            Rectangle()
                .ignoresSafeArea(.all)
            CardView(SetCardViewModel(Card(feature1: .squiggle, feature2: .green, feature3: .striped, feature4: .one)))
                .frame(width: 200)
        }
    }
}
