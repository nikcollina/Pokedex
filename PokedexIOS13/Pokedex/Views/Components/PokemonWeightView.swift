//
//  PokemonWeightView.swift
//  Pokedex
//
//  Created by Nikolas Collina on 9/21/20.
//  Copyright © 2020 Nikolas Collina. All rights reserved.
//

import SwiftUI

struct PokemonWeightView: View {
    let weight : Double

    var body: some View {
        HStack{
            Text("Weight: ")
            Text(String(format: "%.2f", weight))
            Text("kg")
        }
    }
}

struct PokemonWeightView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonWeightView(weight: 1.21)
    }
}
