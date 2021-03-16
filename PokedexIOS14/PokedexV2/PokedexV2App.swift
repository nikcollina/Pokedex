//
//  PokedexV2App.swift
//  PokedexV2
//
//  Created by Nikolas Collina on 10/2/20.
//

import SwiftUI

@main
struct PokedexV2App: App {
    let pokedex = Pokedex()
    @Environment(\.scenePhase) private var scenePhase
    var body: some Scene {
        WindowGroup {
            PokedexCardView().environmentObject(pokedex)
        }.onChange(of: scenePhase) { phase in
            switch phase {
            case .inactive:
                pokedex.saveData()
            default:
                break
            }
        }
    }
}
