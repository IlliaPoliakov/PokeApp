//
//  PrevNextUrlEntity+CoreDataProperties.swift
//  PokeApp
//
//  Created by Illia Poliakov on 15.11.22.
//
//

import Foundation
import CoreData


extension PrevNextUrlEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PrevNextUrlEntity> {
        return NSFetchRequest<PrevNextUrlEntity>(entityName: "PrevNextUrlEntity")
    }

    @NSManaged public var nextUrl: URL?
    @NSManaged public var previousUrl: URL?

}

extension PrevNextUrlEntity : Identifiable {

}
