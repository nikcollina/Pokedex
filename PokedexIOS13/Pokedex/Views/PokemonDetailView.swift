//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Nikolas Collina on 9/20/20.
//  Copyright © 2020 Nikolas Collina. All rights reserved.
//

import SwiftUI

struct PokemonDetailView: View {
//    @Binding var pokemon : Pokemon
    @EnvironmentObject var pokedex : Pokedex
    var id : Int
    var body: some View {
        
        ScrollView {
            VStack{
                PokemonCapturedButton(isCaptured: $pokedex.allPokemon[id].captured)
                PokemonPictureView(id: pokedex.allPokemon[id].id).grayscale(pokedex.allPokemon[id].captured ? ViewConstants.notGrey : ViewConstants.grayConst)
                VStack(alignment: .leading){
                    
                    PokemonHeightView(height: pokedex.allPokemon[id].height)
                    PokemonWeightView(weight: pokedex.allPokemon[id].weight)
                    PokemonTypesView(types: pokedex.allPokemon[id].types)
                    PokemonWeaknessView(weaknesses: pokedex.allPokemon[id].weaknesses)
                    EvolvesFrom(prevEvolution: pokedex.allPokemon[id].prevEvolution)
                    EvolvesInto(nextEvolution: pokedex.allPokemon[id].nextEvolution)
                }
            }.navigationBarTitle(pokedex.allPokemon[id].name).padding()
        }
        


    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    @State static var pokedex = Pokedex()
    static var previews: some View {
        PokemonDetailView(id: 1)

    }
}
