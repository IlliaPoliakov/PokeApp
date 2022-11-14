//
//  DataBaseDataSource.swift
//  PokeApp
//
//  Created by Illia Poliakov on 14.11.22.
//

import Foundation
import CoreData

class DataBaseDataSource {
  
  // -MARK: - Properties -
  
  let coreDataStack = AppDelegate.DIContainer.resolve(CoreDataStack.self)!
  
  
  // -MARK: - Functions -
  
  func loadData() -> [PokemonEntity]? {
    
    guard var pokemons = try? coreDataStack.managedContext.fetch(PokemonEntity.fetchRequest())
    else {
      return nil
    }
    
    if pokemons.isEmpty {
      return nil
    }
    
    return pokemons
  }
  
  func saveNewPokemon(withPokemonName name: String, withDescriptionUrl: URL) -> PokemonEntity {
    let newPokemon = PokemonEntity.init(context: coreDataStack.managedContext)
    
    newPokemon.name = name
    
    coreDataStack.saveContext()
    
    return newPokemon
  }
  
  func updatePokemonData(forPokemonName pokemonName: String,
                         withImageUrl imageUrl: URL,
                         withWeight weight: Int32,
                         withHeight height: Int32,
                         withTypes types: [String]) {
    let predicate = NSPredicate(format: "%K == %@",
                                #keyPath(PokemonEntity.name), "\(pokemonName)")
    let fetchRequest = NSFetchRequest<PokemonEntity>(entityName: "PokemonEntity")
    fetchRequest.resultType = .managedObjectResultType
    fetchRequest.predicate = predicate
    
    guard let pokemon = try? coreDataStack.managedContext.fetch(fetchRequest)
    else {
      return
    }
    
    pokemon.first!.height = height
    pokemon.first!.weight = weight
    pokemon.first!.types = types
    
    coreDataStack.saveContext()
  }
}
