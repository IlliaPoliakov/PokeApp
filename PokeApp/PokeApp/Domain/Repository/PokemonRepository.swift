//
//  PokemonRepository.swift
//  PokeApp
//
//  Created by Illia Poliakov on 15.11.22.
//

import Foundation

protocol PokemonRepository {
  func loadData() -> [PokemonEntity]?
  func saveNewPokemon(withPokemonName name: String, withDescriptionUrl: URL) -> PokemonEntity
  func updatePokemonData(forPokemonName pokemonName: String,
                         withImageUrl imageUrl: URL,
                         withWeight weight: Int32,
                         withHeight height: Int32,
                         withTypes types: [String])
}
