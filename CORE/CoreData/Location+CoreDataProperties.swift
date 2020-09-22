//
//  Location+CoreDataProperties.swift
//  CORE
//
//  Created by Jakub Ruranski on 21/09/2020.
//
//

import Foundation
import CoreData


extension Location {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Location> {
        return NSFetchRequest<Location>(entityName: "Location")
    }

    @NSManaged public var equipment: String?
    @NSManaged public var latitude: Double
    @NSManaged public var longtitude: Double
    @NSManaged public var name: String?
    @NSManaged public var selected: Bool
    @NSManaged public var subtitle: String?
    @NSManaged public var workoutLocation: Workout?

}

extension Location : Identifiable {

}
