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
  
  func addPokemons(_ completion: @escaping ([Pokemon]?, String?) -> Void) {
    let prevNextUrl =  localDataSource.getUrl()
    
    guard prevNextUrl?.nextUrl != nil
    else {
      DispatchQueue.main.async {
        completion(nil, "No Pokemons Yet")
      }
      return
    }
    remoteDataSource.downloadData(withUrl: prevNextUrl!.nextUrl!) { data, error in
      guard data != nil
      else {
        DispatchQueue.main.async {
          completion(nil, error)
        }
      }
      
    }
  }
  
  func parse(withData data: Data) {
      let decoder = JSONDecoder()

      let decodedPokemons = try? decoder.decode(Petitions.self, from: data)
  }
  
  func setAsLovely(withPokemonName pokemonName: String) {
    <#code#>
  }
  
  
}
