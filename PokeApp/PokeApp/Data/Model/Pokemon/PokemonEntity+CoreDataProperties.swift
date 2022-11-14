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

    @NSManaged public var name: String?
    @NSManaged public var descriptionUrl: URL?
    @NSManaged public var weight: Int32
    @NSManaged public var height: Int32
    @NSManaged public var imageUrl: String?
    @NSManaged public var types: [String]?

}

extension PokemonEntity : Identifiable {

}
