//
//  EvolvesInto.swift
//  Pokedex
//
//  Created by Nikolas Collina on 9/30/20.
//  Copyright © 2020 Nikolas Collina. All rights reserved.
//

import SwiftUI

struct EvolvesInto: View {
    let nextEvolution : [Int]?
    var body: some View {
        if nextEvolution != nil {
            VStack {
                Text("Evolves into")
                ForEach(nextEvolution!.indices, id:\.self) {index in
                    NavigationLink(destination: PokemonDetailView(id: nextEvolution![index]-1)) {
                    PokemonCardImage(id: nextEvolution![index])
                    }
                }
            }
        }
    }
}

struct EvolvesInto_Previews: PreviewProvider {
    static var previews: some View {
        EvolvesInto(nextEvolution: [1])
    }
}
