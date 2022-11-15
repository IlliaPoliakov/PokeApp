//
//  PokemonEntity+CoreDataProperties.swift
//  PokeApp
//
//  Created by Illia Poliakov on 15.11.22.
//
//

import Foundation
import CoreData


extension PokemonEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PokemonEntity> {
        return NSFetchRequest<PokemonEntity>(entityName: "PokemonEntity")
    }

    @NSManaged public var name: String
    @NSManaged public var weight: Int32
    @NSManaged public var height: Int32
    @NSManaged public var isLovely: Bool
    @NSManaged public var imageUrl: URL?
    @NSManaged public var types: [String]?
    @NSManaged public var descriptionUrl: URL

}

extension PokemonEntity : Identifiable {

}
