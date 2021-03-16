//
//  PokemonRowView.swift
//  Pokedex
//
//  Created by Nikolas Collina on 9/20/20.
//  Copyright © 2020 Nikolas Collina. All rights reserved.
//

import SwiftUI

struct PokemonRowView: View {
    
    @EnvironmentObject var pokedex : Pokedex
    let pokemon : Pokemon
    
    var body: some View {
        HStack{
            Text(String(format: "%03d", pokemon.id))
            Text(pokemon.name)
            Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
                .opacity(pokedex.allPokemon[pokemon.id-1].captured ? 1 : 0)
            Spacer()
            Image(String(format: "%03d", pokemon.id))
            .resizable()
                .frame(width: ViewConstants.smallImageSize, height: ViewConstants.smallImageSize)
        }
    }
}

struct PokemonRowView_Previews: PreviewProvider {
    static let pokedex = Pokedex()
    static var previews: some View {
        PokemonRowView(pokemon: pokedex.allPokemon[0])
    }
}
