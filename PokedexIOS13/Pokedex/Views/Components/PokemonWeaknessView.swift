//
//  PokemonWeaknessView.swift
//  Pokedex
//
//  Created by Nikolas Collina on 9/20/20.
//  Copyright © 2020 Nikolas Collina. All rights reserved.
//

import SwiftUI

struct PokemonWeaknessView: View {
    let weaknesses : [PokemonType]
    var body: some View {
        VStack (alignment: .leading){
            Text("Weaknesses")
            ScrollView (.horizontal){
                HStack{
                    ForEach(weaknesses.indices, id:\.self) { index in
                        ZStack{
                            RoundedRectangle(cornerRadius: ViewConstants.cornerRadius).foregroundColor(Color.init(pokemonType: self.weaknesses[index])).frame(width: ViewConstants.typeWidth, height: ViewConstants.typeHeight)
                            Text(self.weaknesses[index].id)
                        }
                    }
                }
            }
        }
    }
}

struct PokemonWeaknessView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonWeaknessView(weaknesses: [.fire, .flying])
    }
}
