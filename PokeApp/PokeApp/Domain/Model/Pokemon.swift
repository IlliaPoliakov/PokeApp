//
//  Pokemon.swift
//  PokeApp
//
//  Created by Illia Poliakov on 14.11.22.
//

import Foundation

struct Pokemon: Hashable {
  var name: String
  var descriptionUrl: URL
  var imageUrl: URL?
  var weight: Int32?
  var height: Int32?
  var types: [String]?
  var isLovely: Bool
  
  init(name: String,
       imageUrl: URL? = nil,
       weight: Int32? = nil,
       height: Int32? = nil,
       types: [String]? = nil,
       descriptionUrl: URL,
       isLovely: Bool = false) {
    self.name = name
    self.imageUrl = imageUrl
    self.weight = weight
    self.height = height
    self.types = types
    self.isLovely = isLovely
  }
  
  static func convertFromJsonPokemons(withJsonPokemons pokemons: [JsonPokemon]?) -> [Pokemon]?{
    guard pokemons != nil
    else {
      return nil
    }
    
    var modelPokemons = [Pokemon]()
    pokemons!.forEach { pokemon in
      modelPokemons.append(Pokemon(name: pokemon.name, descriptionUrl: pokemon.url))
    }
    
    return modelPokemons
  }
  
  static func convertFromDescriptionJsonPokemon(withJsonPokemon jsonPokemon:
                                                  DescriptionJsonPokemon,
                                                withPokemon pokemon: Pokemon) -> Pokemon {
    var types = [String]()
    jsonPokemon.types.forEach { type in
      types.append(type.type.name)
    }
    return Pokemon(name: pokemon.name,
                   imageUrl: jsonPokemon.sprites.front_default,
                   weight: jsonPokemon.weight,
                   height: jsonPokemon.height,
                   types: types,
                   descriptionUrl: pokemon.descriptionUrl,
                   isLovely: false)
  }
}
