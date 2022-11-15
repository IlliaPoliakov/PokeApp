//
//  SetAsLovelyPokemonUseCase.swift
//  PokeApp
//
//  Created by Illia Poliakov on 15.11.22.
//

import Foundation

class SetAsLovelyUseCase {
  private let repo: PokemonRepository
  
  init(repo: PokemonRepository) {
    self.repo = repo
  }
  
  func execute(withPokemonName pokemonName: String) {
    repo.setAsLovely(withPokemonName: pokemonName)
  }
}

