//
//  Meal+CoreDataProperties.swift
//  MyKcals
//
//  Created by Kacper on 15/05/2023.
//
//

import Foundation
import CoreData


extension Meal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Meal> {
        return NSFetchRequest<Meal>(entityName: "Meal")
    }

    @NSManaged public var id: UUID!
    @NSManaged public var product_ids: [Int64]?

}
