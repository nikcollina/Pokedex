//
//  PokedexCardView.swift
//  Pokedex
//
//  Created by Nikolas Collina on 10/1/20.
//  Copyright © 2020 Nikolas Collina. All rights reserved.
//

import SwiftUI

struct PokedexCardView: View {
    @ObservedObject var pokedex = Pokedex()
    var body: some View {
        NavigationView{
            
            ScrollView {
                VStack{
                    CapturedRow(categoryName: "captured", property: {$0.captured}).padding()
                
                    ForEach(PokemonType.allCases, id: \.id) { value in
                    if value != .all {
                        VStack (alignment: .leading) {
                            Text("\(value.id) Pokémon")
                            PokemonCardRow(type: value)
                        }.padding()
                    }
                }

                    
                }.navigationBarTitle("Pokédex")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: listButton)
            }
        }
    }
    
    var listButton: some View {
        NavigationLink(destination: PokedexListView()){
            Image(systemName: "list.star")
        }
    }
}


struct PokedexCardView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexCardView()
    }
}
