//
//  Workout+CoreDataProperties.swift
//  CORE
//
//  Created by Jakub Ruranski on 21/09/2020.
//
//

import Foundation
import CoreData


extension Workout {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Workout> {
        return NSFetchRequest<Workout>(entityName: "Workout")
    }

    @NSManaged public var calories: Int32
    @NSManaged public var duration: Int32
    @NSManaged public var endDate: Date?
    @NSManaged public var muscles: String?
    @NSManaged public var name: String?
    @NSManaged public var startDate: Date?
    @NSManaged public var time: Int32
    @NSManaged public var weight: Float
    @NSManaged public var finished: Bool
    @NSManaged public var started: Bool
    @NSManaged public var exercises: NSOrderedSet?
    @NSManaged public var location: Location?
    
    
    public var exercisesArray: [Exercise] {
//        let set = exercises?.sortedArray(using: [NSSortDescriptor(key: "index", ascending: true)])
        let set = exercises?.array as? [Exercise] ?? []
        return set
    }
    
}

// MARK: Generated accessors for exercises
extension Workout {

    @objc(insertObject:inExercisesAtIndex:)
    @NSManaged public func insertIntoExercises(_ value: Exercise, at idx: Int)

    @objc(removeObjectFromExercisesAtIndex:)
    @NSManaged public func removeFromExercises(at idx: Int)

    @objc(insertExercises:atIndexes:)
    @NSManaged public func insertIntoExercises(_ values: [Exercise], at indexes: NSIndexSet)

    @objc(removeExercisesAtIndexes:)
    @NSManaged public func removeFromExercises(at indexes: NSIndexSet)

    @objc(replaceObjectInExercisesAtIndex:withObject:)
    @NSManaged public func replaceExercises(at idx: Int, with value: Exercise)

    @objc(replaceExercisesAtIndexes:withExercises:)
    @NSManaged public func replaceExercises(at indexes: NSIndexSet, with values: [Exercise])

    @objc(addExercisesObject:)
    @NSManaged public func addToExercises(_ value: Exercise)

    @objc(removeExercisesObject:)
    @NSManaged public func removeFromExercises(_ value: Exercise)

    @objc(addExercises:)
    @NSManaged public func addToExercises(_ values: NSOrderedSet)

    @objc(removeExercises:)
    @NSManaged public func removeFromExercises(_ values: NSOrderedSet)

}

extension Workout : Identifiable {

}
