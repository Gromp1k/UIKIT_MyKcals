//
//  EatingDay+CoreDataProperties.swift
//  MyKcals
//
//  Created by Kacper on 15/05/2023.
//
//

import Foundation
import CoreData


extension EatingDay {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EatingDay> {
        return NSFetchRequest<EatingDay>(entityName: "EatingDay")
    }

    @NSManaged public var date: Date!
    @NSManaged public var eaten_food: [Eatable]?

}

extension EatingDay : Identifiable {

}
