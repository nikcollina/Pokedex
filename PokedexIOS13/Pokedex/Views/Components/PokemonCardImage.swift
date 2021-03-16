//
//  PokemonEvolutionPicture.swift
//  Pokedex
//
//  Created by Nikolas Collina on 9/30/20.
//  Copyright © 2020 Nikolas Collina. All rights reserved.
//

import SwiftUI

struct PokemonCardImage: View {
    let id : Int
    @EnvironmentObject var pokedex : Pokedex
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: ViewConstants.cornerRadius).frame(width: ViewConstants.cardImageWidth, height: ViewConstants.cardImageHeight)
                .foregroundColor(Color.init(pokemonType: pokedex.allPokemon[id-1].types[0]))
            VStack(alignment: .center){
                Image(String(format: "%03d", id)).resizable().frame(width:(ViewConstants.cardImageWidth*ViewConstants.imageScale), height: (ViewConstants.cardImageWidth*ViewConstants.imageScale))
                Text(pokedex.allPokemon[id-1].name)
                    .font(ViewConstants.captionFont)
                    .foregroundColor(.white)

            }
          
            Image(systemName: "checkmark.circle.fill").frame(width: ViewConstants.cardImageWidth*ViewConstants.imageScale, height: ViewConstants.cardImageHeight*ViewConstants.imageScale, alignment: .topTrailing).foregroundColor(.white).opacity(pokedex.allPokemon[id-1].captured ? 1 : 0)
               
            
        }
    }
}

struct PokemonEvolutionPicture_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCardImage(id: 1)
    }
}
