//
//  AddPokemonsUseCase.swift
//  PokeApp
//
//  Created by Illia Poliakov on 15.11.22.
//

import Foundation

class AddPokemonsUseCase {
  private let repo: PokemonRepository
  
  init(repo: PokemonRepository) {
    self.repo = repo
  }
  
  func execute(_ completion: @escaping ([Pokemon]?, String?) -> Void) {
    repo.addPokemons(completion)
  }
}
