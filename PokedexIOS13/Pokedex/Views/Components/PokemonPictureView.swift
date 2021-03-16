//
//  PokemonPictureView.swift
//  Pokedex
//
//  Created by Nikolas Collina on 9/21/20.
//  Copyright © 2020 Nikolas Collina. All rights reserved.
//

import SwiftUI

struct PokemonPictureView: View {
    let id : Int
    @EnvironmentObject var pokedex : Pokedex
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: ViewConstants.cornerRadius).frame(width: ViewConstants.largeImageSize, height: ViewConstants.largeImageSize).foregroundColor(Color.init(pokemonType: pokedex.allPokemon[id-1].types[0]))

            ZStack(alignment: .bottomTrailing){
                Image(String(format: "%03d", id)).resizable().frame(width:(ViewConstants.largeImageSize*ViewConstants.imageScale), height: (ViewConstants.largeImageSize*ViewConstants.imageScale))
                Text(String(format: "%03d", id))
                    .font(ViewConstants.captionFont)
                    .foregroundColor(.white)
            }
        }
    }
}

struct PokemonPictureView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonPictureView(id: 1)
    }
}
