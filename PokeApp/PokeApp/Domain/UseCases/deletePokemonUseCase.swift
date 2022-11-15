//
//  deletePokemonUseCase.swift
//  PokeApp
//
//  Created by Illia Poliakov on 15.11.22.
//

import Foundation

class DeletePokemonUseCase {
  private let repo: PokemonRepository
  
  init(repo: PokemonRepository) {
    self.repo = repo
  }
  
  func execute(withPokemonName pokemonName: String) {
    repo.deletePokemon(withPokemonName: pokemonName)
  }
}

