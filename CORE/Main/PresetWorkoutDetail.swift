//
//  PresetWorkoutDetail.swift
//  CORE
//
//  Created by Jakub Ruranski on 27/07/2020.
//

import SwiftUI

struct PresetWorkoutDetail: View {
    
    
    
    var body: some View {
        ScrollView {
            VStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text("What to know")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                    Text("Good morning Jack! You have a workout planned for today, shall we get started?")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                }
                .padding(.leading, 16)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(1..<5) { _ in
                            PresetExerciseCard()
                        }
                    }
                    .padding()
                    
                }
                
                HStack {
                    Text("Exercises in this workout")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                    Spacer()
                }
                .padding(.leading, 26)
                
                
                    ForEach(1..<10) { _ in
                        PresetExerciseRow()
                }
                
                .navigationBarTitle(Text("Workout name"))
            }
        }
        
    }
}

struct PresetWorkoutDetail_Previews: PreviewProvider {
    static var previews: some View {
        PresetWorkoutDetail()
    }
}
