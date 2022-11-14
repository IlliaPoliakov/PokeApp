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
    <#code#>
  }
  
  func addPokemons() -> [Pokemon]? {
    <#code#>
  }
  
  
}
