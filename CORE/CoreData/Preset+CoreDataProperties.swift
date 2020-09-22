//
//  Preset+CoreDataProperties.swift
//  CORE
//
//  Created by Jakub Ruranski on 21/09/2020.
//
//

import Foundation
import CoreData


extension Preset {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Preset> {
        return NSFetchRequest<Preset>(entityName: "Preset")
    }

    @NSManaged public var duration: Int32
    @NSManaged public var icon: String?
    @NSManaged public var image: String?
    @NSManaged public var longText: String?
    @NSManaged public var name: String?
    @NSManaged public var saved: Bool
    @NSManaged public var presetExercises: NSOrderedSet?

    
    public var exercisesArray: [Exercise] {
        let set = presetExercises?.array as? [Exercise] ?? []
        
        
        return set
    }
    
}

// MARK: Generated accessors for presetExercises
extension Preset {

    @objc(insertObject:inPresetExercisesAtIndex:)
    @NSManaged public func insertIntoPresetExercises(_ value: Exercise, at idx: Int)

    @objc(removeObjectFromPresetExercisesAtIndex:)
    @NSManaged public func removeFromPresetExercises(at idx: Int)

    @objc(insertPresetExercises:atIndexes:)
    @NSManaged public func insertIntoPresetExercises(_ values: [Exercise], at indexes: NSIndexSet)

    @objc(removePresetExercisesAtIndexes:)
    @NSManaged public func removeFromPresetExercises(at indexes: NSIndexSet)

    @objc(replaceObjectInPresetExercisesAtIndex:withObject:)
    @NSManaged public func replacePresetExercises(at idx: Int, with value: Exercise)

    @objc(replacePresetExercisesAtIndexes:withPresetExercises:)
    @NSManaged public func replacePresetExercises(at indexes: NSIndexSet, with values: [Exercise])

    @objc(addPresetExercisesObject:)
    @NSManaged public func addToPresetExercises(_ value: Exercise)

    @objc(removePresetExercisesObject:)
    @NSManaged public func removeFromPresetExercises(_ value: Exercise)

    @objc(addPresetExercises:)
    @NSManaged public func addToPresetExercises(_ values: NSOrderedSet)

    @objc(removePresetExercises:)
    @NSManaged public func removeFromPresetExercises(_ values: NSOrderedSet)

}

extension Preset : Identifiable {

}
