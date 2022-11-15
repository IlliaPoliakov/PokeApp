//
//  PokemonGroupEntity+CoreDataProperties.swift
//  PokeApp
//
//  Created by Illia Poliakov on 15.11.22.
//
//

import Foundation
import CoreData


extension PokemonGroupEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PokemonGroupEntity> {
        return NSFetchRequest<PokemonGroupEntity>(entityName: "PokemonGroupEntity")
    }

    @NSManaged public var nextUrl: URL?
    @NSManaged public var previousUrl: URL?
    @NSManaged public var pokemons: [PokemonEntity]?

}

// MARK: Generated accessors for pokemons
extension PokemonGroupEntity {

    @objc(addPokemonsObject:)
    @NSManaged public func addToPokemons(_ value: PokemonEntity)

    @objc(removePokemonsObject:)
    @NSManaged public func removeFromPokemons(_ value: PokemonEntity)

    @objc(addPokemons:)
    @NSManaged public func addToPokemons(_ values: NSSet)

    @objc(removePokemons:)
    @NSManaged public func removeFromPokemons(_ values: NSSet)

}

extension PokemonGroupEntity : Identifiable {

}
