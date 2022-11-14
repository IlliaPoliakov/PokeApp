//
//  PokemonEntity+CoreDataClass.swift
//  PokeApp
//
//  Created by Illia Poliakov on 14.11.22.
//
//

import Foundation
import CoreData

@objc(PokemonEntity)
public class PokemonEntity: NSManagedObject {
  static func convertToDomain(pokemonEntitis entities: [PokemonEntity]) -> [Pokemon]? {
    guard !entities.isEmpty
    else {
      return nil
    }
    
    var domainPokemons = [Pokemon]()
    
    entities.forEach { entity in
      domainPokemons.append(Pokemon(name: entity.name,
                                    imageUrl: entity.imageUrl,
                                    weight: entity.weight,
                                    height: entity.height,
                                    types: entity.types))
    }
    return domainPokemons
  }
}
