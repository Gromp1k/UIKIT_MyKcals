//
//  Eatable+CoreDataProperties.swift
//  MyKcals
//
//  Created by Kacper on 15/05/2023.
//
//

import Foundation
import CoreData


extension Eatable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Eatable> {
        return NSFetchRequest<Eatable>(entityName: "Eatable")
    }

    @NSManaged public var name: String!

}

extension Eatable : Identifiable {

}
