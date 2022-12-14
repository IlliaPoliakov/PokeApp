//  GetPokemonsUseCase.swift
//  PokeApp
//
//  Created by Illia Poliakov on 15.11.22.
//

class GetPokemonsUseCase {
  private let repo: PokemonRepository
  
  init(repo: PokemonRepository) {
    self.repo = repo
  }
  
  func execute(_ completion: @escaping ([Pokemon]?) -> Void) {
    completion(repo.getPokemons())
  }
}
