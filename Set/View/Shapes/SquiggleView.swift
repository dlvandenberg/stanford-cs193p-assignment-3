//
//  SquiggleView.swift
//  Set
//
//  Created by Dennis van den Berg on 02/05/2023.
//

import SwiftUI

struct SquiggleView: View {
    typealias CurvePoint = Squiggle.CurvePoint
    
    var startPoint = CGPoint(x: 40, y: 0)
    var curvePoints = [
        CurvePoint(to: CGPoint(x: 0, y: 35), control1: CGPoint(x: 30, y: 0), control2: CGPoint(x: 0, y: 5)),
        CurvePoint(to: CGPoint(x: 40, y: 55), control1: CGPoint(x: 0, y: 80), control2: CGPoint(x: 20, y: 65)),
        CurvePoint(to: CGPoint(x: 90, y: 55), control1: CGPoint(x: 50, y: 50), control2: CGPoint(x: 80, y: 50)),
        CurvePoint(to: CGPoint(x: 135, y: 20), control1: CGPoint(x: 110, y: 65), control2: CGPoint(x: 135, y: 55)),
        CurvePoint(to: CGPoint(x: 110, y: 10), control1: CGPoint(x: 135, y: 0), control2: CGPoint(x: 130, y: -10)),
        CurvePoint(to: CGPoint(x: 40, y: 0), control1: CGPoint(x: 95, y: 25), control2: CGPoint(x: 65, y: 0)),
    ]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Dot(color: .blue, position: startPoint)
                    ForEach(curvePoints, id: \.self) { curvePoint in
                        Dot(color: .green, position: curvePoint.point)
                        Dot(color: .red, position: curvePoint.control1)
                        Dot(color: .red, position: curvePoint.control2)
                    }
                Squiggle(for: curvePoints)
                    .stroke(lineWidth: 2)
                    .overlay(Rectangle().opacity(0.4))
            }
            
            .padding(10)
        }
    }
}

struct Dot: View {
    var color: Color
    var position: CGPoint
    
    var body: some View {
        Circle()
            .frame(width: 10, height: 10)
            .foregroundColor(color)
            .position(position)
    }
}

struct SquiggleView_Previews: PreviewProvider {
    static var previews: some View {
        SquiggleView()
    }
}
