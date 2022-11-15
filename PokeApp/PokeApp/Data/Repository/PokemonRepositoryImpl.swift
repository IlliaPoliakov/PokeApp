//
//  PokemonRepositoryImpl.swift
//  PokeApp
//
//  Created by Illia Poliakov on 15.11.22.
//

import Foundation

class PokemonRepositoryImpl: PokemonRepository {

  // -MARK: - Properties -
  
  private let localDataSource: DataBaseDataSource
  private let remoteDataSource: NetworkDataSource
  
  init(localDataSource: DataBaseDataSource,
       remoteDataSource: NetworkDataSource) {
    self.localDataSource = localDataSource
    self.remoteDataSource = remoteDataSource
  }
  
  
  // -MARK: - UseCase funcs -
  
  func getPokemons() -> [Pokemon]? {
    let pokemons = localDataSource.loadData()
    
    guard pokemons != nil
    else {
      return nil
    }
    
   var modelPokemons = [Pokemon]()
    
    pokemons!.forEach { pokemon in
      modelPokemons.append(PokemonEntity.convertToDomain(pokemonEntity: pokemon))
    }
    
    return modelPokemons
  }
  

  
  func parsePokemonGroup(withData data: Data) -> JsonPokemonsGroup? {
    
    return try? JSONDecoder().decode(JsonPokemonsGroup.self, from: data)
  }
  
  func parsePokemonDescription(withData data: Data) -> DescriptionJsonPokemon? {
    
    return try? JSONDecoder().decode(DescriptionJsonPokemon.self, from: data)
  }
  
  func setAsLovely(withPokemonName pokemonName: String) {
    localDataSource.setAsLovely(withPokemonName: pokemonName)
  }
  
  
}
