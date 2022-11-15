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
  
  // in a nutshell, I didn't find better way to store next/previous pages urls, mb via KVO,
  // but, probably in perspectiv app empowerment it may be best approach
  
  func getPrevNextUrl() -> PrevNextUrlEntity? {
    guard let prevNext = try? coreDataStack.managedContext.fetch(PrevNextUrlEntity.fetchRequest())
    else {
      return nil
    }
    
    if prevNext.isEmpty {
      return nil
    }
    
    return prevNext.first
  }
  
  func saveNewPokemon(withPokemonName name: String,
                      withDescriptionUrl descriptionUrl: URL,
                      withHeight height: Int32,
                      withWeight weight: Int32,
                      withImageurl imageUrl: URL,
                      withTypes types: [String]) {
    let newPokemon = PokemonEntity.init(context: coreDataStack.managedContext)
    
    newPokemon.name = name
    newPokemon.descriptionUrl = descriptionUrl
    newPokemon.imageUrl = imageUrl
    newPokemon.height = height
    newPokemon.weight = weight
    newPokemon.types = types
    
    coreDataStack.saveContext()
  }
  
  func saveNewPrevNextUrl(withPreviousUrl prevUrl: URL?, withNextUrl nextUrl: URL?) -> PrevNextUrlEntity {
    let newPrevNext = PrevNextUrlEntity.init(context: coreDataStack.managedContext)
    
    newPrevNext.previousUrl = prevUrl
    newPrevNext.nextUrl = nextUrl
    
    coreDataStack.saveContext()
    
    return newPrevNext
  }
  
  func adjustLovelyState(withPokemonName pokemonName: String) {
    let predicate = NSPredicate(format: "%K == %@",
                                #keyPath(PokemonEntity.name), "\(pokemonName)")
    let fetchRequest = NSFetchRequest<PokemonEntity>(entityName: "PokemonEntity")
    fetchRequest.resultType = .managedObjectResultType
    fetchRequest.predicate = predicate
    
    guard let pokemon = try? coreDataStack.managedContext.fetch(fetchRequest)
    else {
      return
    }
    
    pokemon.first?.isLovely = !pokemon.first!.isLovely
    
    coreDataStack.saveContext()
  }
  
  func deletePokemon(withPokemonName pokemonName: String) {
    let predicate = NSPredicate(format: "%K == %@",
                                #keyPath(PokemonEntity.name), "\(pokemonName)")
    let fetchRequest = NSFetchRequest<PokemonEntity>(entityName: "PokemonEntity")
    fetchRequest.resultType = .managedObjectResultType
    fetchRequest.predicate = predicate
    
    guard let pokemon = try? coreDataStack.managedContext.fetch(fetchRequest)
    else {
      return
    }
    
    coreDataStack.managedContext.delete(pokemon.first!)
    
    coreDataStack.saveContext()
  }
}
