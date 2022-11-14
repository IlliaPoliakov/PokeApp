//
//  PokemonEntity+CoreDataProperties.swift
//  PokeApp
//
//  Created by Illia Poliakov on 14.11.22.
//
//

import Foundation
import CoreData


extension PokemonEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PokemonEntity> {
        return NSFetchRequest<PokemonEntity>(entityName: "PokemonEntity")
    }

    @NSManaged public var name: String
    @NSManaged public var imageUrl: URL
    @NSManaged public var types: [String]
    @NSManaged public var weight: Int64
    @NSManaged public var height: Int64

}

extension PokemonEntity : Identifiable {

}
