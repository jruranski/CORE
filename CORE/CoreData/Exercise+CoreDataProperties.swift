//
//  Exercise+CoreDataProperties.swift
//  CORE
//
//  Created by Jakub Ruranski on 21/09/2020.
//
//

import Foundation
import CoreData


extension Exercise {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Exercise> {
        return NSFetchRequest<Exercise>(entityName: "Exercise")
    }

    @NSManaged public var difficulty: Float
    @NSManaged public var equipment: String?
    @NSManaged public var favorite: Bool
    @NSManaged public var gifName: String?
    @NSManaged public var id: Int16
    @NSManaged public var instructions: String?
    @NSManaged public var modelURL: String?
    @NSManaged public var muscle: String?
    @NSManaged public var name: String?
    @NSManaged public var progress: Int16
    @NSManaged public var reps: Int16
    @NSManaged public var rest: Int16
    @NSManaged public var sets: Int16
    @NSManaged public var weight: Float
    @NSManaged public var selected: Bool
    @NSManaged public var completed: Bool
    @NSManaged public var preset: Preset?
    @NSManaged public var workout: Workout?
    @NSManaged public var index: Int16
    
    
    public var exerciseType: String {
        
        var type = "Cardio"
        
        let muscleString: String = muscle ?? ""
        
        let muscleArray = muscleString.components(separatedBy: ";")
        
        let first = muscleArray[0]
           
        if first == "Cardio" {
            type = first
            }
        
        
        return type
    }
    
    public var exerciseMuscle: String {
        var muscle = ""
        
        let muscleString: String = muscle
        
        let muscleArray = muscleString.components(separatedBy: ";")
        
      let first = muscleArray[0]
            if first != "Cardio" {
                muscle = first
            }else{
                 let second = muscleArray[1]
                    muscle = second
                
            
        }
        
        
        return muscle
    }
    
}

extension Exercise : Identifiable {

}
