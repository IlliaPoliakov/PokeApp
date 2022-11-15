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
    guard let pokemons = try? coreDataStack.managedContext.fetch(PokemonEntity.fetchRequest())
    else {
      return nil
    }
    
    if pokemons.isEmpty {
      return nil
    }
    
    return pokemons
  }
  
  func getPrevNextUrl() -> PrevNextUrlEntity? {
    guard let prevNext = try? coreDataStack.managedContext.fetch(PrevNextUrlEntity.fetchRequest())
    else {
      return nil
    }
    
//    coreDataStack.managedContext.delete(prevNext.first!)
//    coreDataStack.saveContext()
    
    if prevNext.isEmpty {
      return nil
    }
    
    return prevNext.first
  }
  
  func saveNewPokemon(withPokemonName name: String,
                      withDescriptionUrl descriptionUrl: URL) -> PokemonEntity {
    let newPokemon = PokemonEntity.init(context: coreDataStack.managedContext)
    
    newPokemon.name = name
    newPokemon.descriptionUrl = descriptionUrl
    
    coreDataStack.saveContext()
    
    return newPokemon
  }
  
  func saveNewPrevNextUrl(withPreviousUrl prevUrl: URL?, withNextUrl nextUrl: URL?) -> PrevNextUrlEntity {
    let newPrevNext = PrevNextUrlEntity.init(context: coreDataStack.managedContext)
    
    newPrevNext.previousUrl = prevUrl
    newPrevNext.nextUrl = nextUrl
    
    coreDataStack.saveContext()
    
    return newPrevNext
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
  
  func setAsLovely(withPokemonName pokemonName: String) {
    let predicate = NSPredicate(format: "%K == %@",
                                #keyPath(PokemonEntity.name), "\(pokemonName)")
    let fetchRequest = NSFetchRequest<PokemonEntity>(entityName: "PokemonEntity")
    fetchRequest.resultType = .managedObjectResultType
    fetchRequest.predicate = predicate
    
    guard let pokemon = try? coreDataStack.managedContext.fetch(fetchRequest)
    else {
      return
    }
    
    pokemon.first?.isLovely = true
    
    coreDataStack.saveContext()
  }
  
  func setAsUnlovely(withPokemonName pokemonName: String) {
    let predicate = NSPredicate(format: "%K == %@",
                                #keyPath(PokemonEntity.name), "\(pokemonName)")
    let fetchRequest = NSFetchRequest<PokemonEntity>(entityName: "PokemonEntity")
    fetchRequest.resultType = .managedObjectResultType
    fetchRequest.predicate = predicate
    
    guard let pokemon = try? coreDataStack.managedContext.fetch(fetchRequest)
    else {
      return
    }
    
    pokemon.first?.isLovely = false
    
    coreDataStack.saveContext()
  }
}
