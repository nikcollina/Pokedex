//
//  EvolvesFrom.swift
//  Pokedex
//
//  Created by Nikolas Collina on 9/30/20.
//  Copyright © 2020 Nikolas Collina. All rights reserved.
//

import SwiftUI

struct EvolvesFrom: View {
    let prevEvolution : [Int]?
    var body: some View {
        if prevEvolution != nil {
            VStack {
                Text("Evolves from")
                ForEach(prevEvolution!.indices, id:\.self) {index in
                    NavigationLink(destination: PokemonDetailView(id: prevEvolution![index]-1)) {
                    PokemonCardImage(id: prevEvolution![index])
                    }
                }
            }
        }
    }
}

struct EvolvesFrom_Previews: PreviewProvider {
    static var previews: some View {
        EvolvesFrom(prevEvolution: [1])
    }
}
