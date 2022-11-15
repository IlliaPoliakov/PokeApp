//
//  JsonStructs.swift
//  PokeApp
//
//  Created by Illia Poliakov on 15.11.22.
//

import Foundation

struct JsonPokemonsGroup: Decodable {
  var next: URL
  var previous: URL
  var results: [JsonPokemons]
}

struct JsonPokemons: Decodable {
  var name: String
  var url: URL
}

struct JsonPokemonsDescription: Decodable {
  var height: Int32
  var weight: Int32
  var types:
}

struct JsonPokemonsDescriptionTypes: Decodable {
  
}
