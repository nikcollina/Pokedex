//
//  PokedexModel.swift
//  Pokedex
//
//  Created by Nikolas Collina on 9/20/20.
//  Copyright © 2020 Nikolas Collina. All rights reserved.
//

import Foundation

struct Pokemon : Codable {
    let id : Int
    let name : String
    let types : [PokemonType]
    let height : Double
    let weight : Double
    let weaknesses : [PokemonType]
    let prevEvolution : [Int]?
    let nextEvolution : [Int]?
    var captured : Bool

    
    enum CodingKeys : String, CodingKey {
        case id
        case name
        case types
        case height
        case weight
        case weaknesses

        case prevEvolution =  "prev_evolution"
        case nextEvolution = "next_evolution"
        case captured

    }
}

typealias AllPokemon = [Pokemon]

class Pokedex : ObservableObject {
    
    @Published var  allPokemon : AllPokemon {
        didSet {
            saveData()
        }
    }
    
    let destinationURL : URL
    
    init() {
        let filename = "pokedex-v2"
        let mainBundle = Bundle.main
        let bundleURL = mainBundle.url(forResource: filename, withExtension: "json")!
        
        let fileManager = FileManager.default
        let documentURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        destinationURL = documentURL.appendingPathComponent(filename + ".json")
        let fileExists = fileManager.fileExists(atPath: destinationURL.path)
        
        do {
            let url = fileExists ? destinationURL : bundleURL
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            allPokemon = try decoder.decode(AllPokemon.self, from: data)

        }
        catch {
            print("Error info: \(error)")
            allPokemon = []
        }
        
        
    }
    
    func saveData() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(allPokemon)
            try data.write(to: self.destinationURL)
        } catch {
            print("Error writing: \(error)")
        }
    }
    
    func filterType(type : PokemonType) -> [Int] {
        var ids = [Int]()
        for pokemon in allPokemon {
            if pokemon.types.contains(type) {
                ids.append(pokemon.id)
            }
        }
        return ids
    }

        
    func pokemonIndicies(for property : (Pokemon) -> Bool) -> [Int] {
        let filteredPokemon = allPokemon.filter(property)
        let indicies = filteredPokemon.map {p in allPokemon.firstIndex(where: {$0.name == p.name})!}
        return indicies
    }
      
        
    
}
