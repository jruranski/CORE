//
//  PresetWorkoutDetail.swift
//  CORE
//
//  Created by Jakub Ruranski on 27/07/2020.
//

import SwiftUI

struct PresetWorkoutDetail: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    var preset: Preset?
    
    var exercisesPreviewArray: [Exercise] = []
    
    @State var isLoadingPresets: Bool = true
    
    func getExercises() -> [Exercise] {
        
        var exercises: [Exercise] = []
        
        if let exerciseArray = preset?.exercisesArray {
        var isPresent = false
        
        for index in exerciseArray.indices {
            for exercise in exercises {
                if exercise.name == exerciseArray[index].name {
                    isPresent = true
                    break
                }
            }
            if isPresent == false {
                exercises.append(exerciseArray[index])
            }
            isPresent = false
        }
        
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(200) ) {
            self.isLoadingPresets = false
        }
        return exercises
        
    }
    
    init(preset: Preset) {
        self.preset = preset
        exercisesPreviewArray = getExercises()
    }
    
    
    var body: some View {
        ScrollView {
            VStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text("What to know")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                    Text(preset?.longText ?? "Good morning Jack! You have a workout planned for today, shall we get started?")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                }
                .padding(.leading, 16)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(exercisesPreviewArray) { exercise in
                            PresetExerciseCard(exercise: exercise)
                        }
                    }
                    .padding()
                    
                }.redacted(reason: isLoadingPresets ? .placeholder : [])
                
                HStack {
                    Text("Exercises in this workout")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                    Spacer()
                }
                .padding(.leading, 26)
                
                
                ForEach(preset!.exercisesArray) { exercise in
                        PresetExerciseRow(exercise: exercise)
                }
                
                .navigationBarTitle(Text(preset?.name ?? "Workout name"))
                    .navigationBarItems(trailing:
                    
                                            HStack(spacing: 10) {
                                                
                                                Image(systemName: "bookmark")
                                                
                                                Image(systemName: "plus")
                                                    .renderingMode(.original)
                                                    .font(.system(size: 18, weight: .bold, design: .rounded))
                                                    //                .aspectRatio(contentMode: .fit)
                                                    .padding(.all,  2)
                                                    .frame(width: 36, height: 36, alignment: .center)
                                                    .background(Color.white)
                                                    .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
                                                .shadow(color: Color(.label).opacity(0.15), radius: 10, y: 3)
                                                    .shadow(color: Color(.label).opacity(0.15), radius: 1, y: 1)
                                            }
                                        
                
                    
                    )
            }
        }
        
    }
}

struct PresetWorkoutDetail_Previews: PreviewProvider {
    static var previews: some View {
        PresetWorkoutDetail(preset: Preset(context: PersistenceController.preview.container.viewContext))
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
