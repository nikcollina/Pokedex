//
//  ContentView.swift
//  Pokedex
//
//  Created by Nikolas Collina on 9/20/20.
//  Copyright © 2020 Nikolas Collina. All rights reserved.
//

import SwiftUI

struct PokedexListView: View {
    

    @EnvironmentObject var pokedex : Pokedex
    @State var type : PokemonType = .all
    
    
    var body: some View {
            List{
                if type == .all {
                    ForEach(pokedex.allPokemon.indices, id:\.self) {index in
                        
                        NavigationLink(destination: PokemonDetailView( id: index)) {
                            PokemonRowView(pokemon: self.pokedex.allPokemon[index])
                        }
                        
                    }
                }
                else {
                    ForEach(pokedex.filterType(type: type), id:\.self) {index in
                        
                        NavigationLink(destination: PokemonDetailView(id: index - 1)) {
                            PokemonRowView(pokemon: self.pokedex.allPokemon[index-1])
                        }
                        
                    }
                }
            }
            .navigationBarTitle("\(type.id) Pokémon")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    typeFilter
                }
            }
    }
    
    var typeFilter : some View {
        Picker(selection: $type, label: Text("Types")) {
            ForEach(PokemonType.allCases, id: \.id) { value in
                Text(value.id)
                    .tag(value)
            }
        }.pickerStyle(MenuPickerStyle())
    }
    
        

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexListView( type: .bug)

    }
}
