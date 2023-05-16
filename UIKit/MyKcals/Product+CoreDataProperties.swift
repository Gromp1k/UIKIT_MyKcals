//
//  Product+CoreDataProperties.swift
//  MyKcals
//
//  Created by Kacper on 15/05/2023.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var carbs: Int64
    @NSManaged public var fats: Int64
    @NSManaged public var id: UUID!
    @NSManaged public var kcalories: Int64
    @NSManaged public var proteins: Int64
    @NSManaged public var sugars: Int64

}
