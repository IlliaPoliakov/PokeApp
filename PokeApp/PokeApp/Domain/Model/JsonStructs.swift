//
//  JsonStructs.swift
//  PokeApp
//
//  Created by Illia Poliakov on 15.11.22.
//

import Foundation

struct JsonPokemonsGroup: Decodable {
  var next: URL?
  var previous: URL?
  var results: [JsonPokemon]
}

struct JsonPokemon: Decodable {
  var name: String
  var url: URL
}

struct DescriptionJsonPokemon: Decodable {
  var height: Int32
  var weight: Int32
  var types: [DescriptionJsonPokemonTypes]
  var sprites: DescriptionJsonPokemonFrontDefault
}

struct DescriptionJsonPokemonFrontDefault: Decodable {
  var front_default: URL
}

struct DescriptionJsonPokemonTypes: Decodable {
  var type: DescriptionJsonPokemonTypesType
}

struct DescriptionJsonPokemonTypesType: Decodable {
  var name: String
}
