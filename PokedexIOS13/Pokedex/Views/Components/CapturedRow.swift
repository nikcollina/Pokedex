//
//  FavoriteRow.swift
//  Pokedex
//
//  Created by Nikolas Collina on 10/2/20.
//  Copyright © 2020 Nikolas Collina. All rights reserved.
//

import SwiftUI

struct CapturedRow: View {
    
    @EnvironmentObject var pokedex : Pokedex
    let categoryName : String
    let property : ((Pokemon) -> Bool)
    var notEmpty : Bool {pokedex.pokemonIndicies(for: property).count > 0}
    
    
    var body: some View {
        VStack(alignment: .leading) {
            if notEmpty {
                Text("Captured")
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(pokedex.pokemonIndicies(for: property), id:\.self) {index in
                            
                            NavigationLink(destination: PokemonDetailView(id: index)) {
                                PokemonCardImage(id: pokedex.allPokemon[index].id)
                            }
                            
                        }
                    }
                }
                
            }
        }
    }
}

struct FavoriteRow_Previews: PreviewProvider {
    static let pokedex = Pokedex()
    static var property = {(pokemon:Pokemon) in true }
    static var previews: some View {
        CapturedRow(categoryName: "Favorite", property: property)
    }
}
