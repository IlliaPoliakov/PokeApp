//
//  PokemonRepository.swift
//  PokeApp
//
//  Created by Illia Poliakov on 15.11.22.
//

import Foundation

protocol PokemonRepository {
  func getPokemons() -> [Pokemon]?
  func addPokemons(_ completion: @escaping ([Pokemon]?, String?) -> Void)
  func setAsLovely(withPokemonName pokemonName: String)
  func setAsUnlovely(withPokemonName pokemonName: String)
}
