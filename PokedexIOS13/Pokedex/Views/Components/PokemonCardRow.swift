//
//  CardRow.swift
//  Pokedex
//
//  Created by Nikolas Collina on 10/1/20.
//  Copyright © 2020 Nikolas Collina. All rights reserved.
//

import SwiftUI

struct PokemonCardRow: View {
    
    @EnvironmentObject var pokedex : Pokedex
    let type : PokemonType
    
    var body: some View {
        
        ScrollView(.horizontal) {
            HStack {
                ForEach(pokedex.filterType(type: type), id:\.self) {index in
                    
                    NavigationLink(destination: PokemonDetailView(id: index-1)) {
                        PokemonCardImage(id: pokedex.allPokemon[index-1].id)
                    }
                    
                }
            }
        }
    }
}

struct CardRow_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCardRow(type: .fire)
    }
}
