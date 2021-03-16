//
//  PokemonHeightView.swift
//  Pokedex
//
//  Created by Nikolas Collina on 9/21/20.
//  Copyright © 2020 Nikolas Collina. All rights reserved.
//

import SwiftUI

struct PokemonHeightView: View {
    let height : Double
    var body: some View {
        HStack{
            Text("Height: ")
            Text(String(format: "%.2f", height))
            Text("m")
        }
    }
}

struct PokemonHeightView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonHeightView(height: 1.21)
    }
}
