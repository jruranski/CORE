//
//  WorkoutExerciseList.swift
//  CORE
//
//  Created by Jakub Ruranski on 21/09/2020.
//

import SwiftUI

struct WorkoutExerciseList: View {
    @Binding var press: Bool
    var workout: Workout?
    var body: some View {
        LazyVStack {
            ForEach(workout!.exercisesArray) { exercise in
            ExerciseWorkoutCard(press: $press)
            }
        }
        
    }
}

struct WorkoutExerciseList_Previews: PreviewProvider {
    static var previews: some View {
//        WorkoutExerciseList(press: .constant(false))
        Text("")
    }
}
