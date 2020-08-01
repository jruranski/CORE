//
//  WorkoutView.swift
//  CORE
//
//  Created by Jakub Ruranski on 24/07/2020.
//

import SwiftUI

struct WorkoutView: View {
    var body: some View {
        NavigationView {
            VStack {
                WorkoutSummaryCard()
                    .padding(.top, 10)
                
                ExerciseWorkoutCard()
                
                Spacer()
                
                
                    .navigationBarTitle(Text("Workout")
                                            .font(.system(size:30, weight: .bold, design: .rounded))
                )
            }
        }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView()
    }
}
