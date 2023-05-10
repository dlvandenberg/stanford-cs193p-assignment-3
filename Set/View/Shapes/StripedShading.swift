//
//  StripedShading.swift
//  Set
//
//  Created by Dennis van den Berg on 08/05/2023.
//

import SwiftUI

struct StripedShading: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .zero)
            let spacing = rect.width * DrawingConstants.spacingFactor
            var currentX = 0.0 {
                didSet {
                    path.move
                }
            }
        }
    }
    
    static struct DrawingConstants {
        static let spacingFactor: CGFloat = 0.07
        static let lineWidthFactor: CGFloat = 0.02
    }
}

