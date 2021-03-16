//
//  TypesView.swift
//  Pokedex
//
//  Created by Nikolas Collina on 9/20/20.
//  Copyright © 2020 Nikolas Collina. All rights reserved.
//

import SwiftUI

struct PokemonTypesView: View {
    let types : [PokemonType]
    var body: some View {
        VStack (alignment: .leading){
            Text("Types")
            ScrollView (.horizontal){
                HStack{
                    ForEach(types.indices, id:\.self) { index in
                        ZStack{
                            RoundedRectangle(cornerRadius: ViewConstants.cornerRadius).foregroundColor(Color.init(pokemonType: self.types[index])).frame(width: ViewConstants.typeWidth, height: ViewConstants.typeHeight)
                            Text(self.types[index].id)
                        }
                    }
                }
            }
        }
    }
}

struct TypesView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonTypesView(types: [.fire, .flying])
    }

}
