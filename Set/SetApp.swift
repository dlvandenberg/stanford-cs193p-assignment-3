//
//  SetApp.swift
//  Set
//
//  Created by Dennis van den Berg on 01/05/2023.
//

import SwiftUI

@main
struct SetApp: App {
    private let game = SetViewModel()
    var body: some Scene {
        WindowGroup {
            SetView(game: game)
        }
    }
}
