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
    var prevNextUrl =  localDataSource.getPrevNextUrl()
    
    if prevNextUrl == nil {
      prevNextUrl = localDataSource.saveNewPrevNextUrl(withPreviousUrl: nil,
                                                       withNextUrl: URL(string: "https://pokeapi.co/api/v2/pokemon")!)
    }
    
    guard prevNextUrl?.nextUrl != nil
    else {
      DispatchQueue.main.async {
        completion(nil, "There is No More Pokemons")
      }
      return
    }
    
    DispatchQueue.global(qos: .userInitiated).async {
      self.remoteDataSource.downloadData(withUrl: prevNextUrl!.nextUrl!) { data, error in
        guard data != nil
        else {
          DispatchQueue.main.async {
            completion(nil, error)
          }
          return
        }
        
        let jsonPokemonGroup = self.parsePokemonGroup(withData: data!)
        let modelPokemons: [Pokemon]? = Pokemon.convertFromJsonPokemons(
          withJsonPokemons: jsonPokemonGroup!.results)
        DispatchQueue.main.async {
          completion(modelPokemons, nil)
        }
        
        prevNextUrl?.nextUrl = jsonPokemonGroup?.next
        prevNextUrl?.previousUrl = jsonPokemonGroup?.previous
        
        let group = DispatchGroup()
        
        var expendedModelPokemons = [Pokemon]()
        
        modelPokemons!.forEach { pokemon in
          group.enter()
          self.remoteDataSource.downloadData(withUrl: pokemon.descriptionUrl) {
            descriptionData, descriptionError in
            guard descriptionData != nil
            else {
              group.leave()
              return //mistake can occure
            }
            
            let descriptionJsonPokemon = self.parsePokemonDescription(withData: descriptionData!)
            
            expendedModelPokemons.append(Pokemon
              .convertFromDescriptionJsonPokemon(withJsonPokemon: descriptionJsonPokemon!,
                                                 withPokemon: pokemon))
            
            group.leave()
          }
        }
        
        group.wait()
        
        DispatchQueue.main.async {
          completion(expendedModelPokemons, nil)
        }
      }
    }
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
  
  func setAsUnlovely(withPokemonName pokemonName: String) {
    localDataSource.setAsLovely(withPokemonName: pokemonName)
  }
  
  
}
