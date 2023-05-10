//
//  SquiggleView.swift
//  Set
//
//  Created by Dennis van den Berg on 02/05/2023.
//

import SwiftUI

struct SquiggleView: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 10, height: 10)
                .onDrag(<#T##data: () -> NSItemProvider##() -> NSItemProvider#>)
        }
    }
}

struct SquiggleView_Previews: PreviewProvider {
    static var previews: some View {
        SquiggleView()
    }
}
