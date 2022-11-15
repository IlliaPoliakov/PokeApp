//
//  PokemonEntity+CoreDataClass.swift
//  PokeApp
//
//  Created by Illia Poliakov on 15.11.22.
//
//

import Foundation
import CoreData

@objc(PokemonEntity)
public class PokemonEntity: NSManagedObject {
  static func convertToDomain(pokemonEntity entity: PokemonEntity) -> Pokemon {

    return Pokemon(name: entity.name,
                   imageUrl: entity.imageUrl,
                   weight: entity.weight,
                   height: entity.height,
                   types: entity.types,
                   descriptionUrl: entity.descriptionUrl,
                   isLovely: entity.isLovely)
  }
}
