//
//  PokemonRepository.swift
//  PokeApp
//
//  Created by Illia Poliakov on 15.11.22.
//

import Foundation

protocol PokemonRepository {
  func getPokemons() -> [Pokemon]?
  func addPokemons(_ completion: @escaping ([Pokemon]?, PossibleErrors?) -> Void)
  func adjustLovelyState(withPokemonName pokemonName: String)
  func deletePokemon(withPokemonName pokemonName : String)
}
