//
//  ExercisesView.swift
//  CORE
//
//  Created by Jakub Ruranski on 25/07/2020.
//

import SwiftUI

struct ExerciseSection {
    var title: String
    var exercises: [Exercise]
}



struct ExercisesView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(entity: Exercise.entity(), sortDescriptors: []) private var exercises: FetchedResults<Exercise>
    
    @State var showDetail: Bool = false
    @State var press: Bool = false
    @State var searchText: String = ""
    @State var selectedLocation: Location?
    @State var showLocation: Bool = false
    
    @Binding var showExercises: Bool
    var workout: Workout?
    
    
    init(showExercises: Binding<Bool>, workout: Workout) {
        self.workout = workout
        self._showExercises = showExercises
    }
    
    
    var body: some View {
        
            
        ZStack {
            VStack {
                VStack {
                    HStack {
                        HStack(spacing: 2) {
                            Button(action: { showExercises.toggle()}) {
                                Image(systemName: "chevron.left")
                                    .font(.system(size: 26, weight: .bold, design: .rounded))
                            }.buttonStyle(PlainButtonStyle())
                                Text("Exercises")
                //                    .padding()
                                    .font(.system(size: 30, weight: .bold, design: .rounded))
                                Spacer()
                                
                        }
                        
                    }
                    }
                    .padding(.horizontal, 10)
                    .padding(.leading , 8)
                .padding(.top, 30)
                    VStack {
                    SearchBar(text: $searchText)
                    
                    ScrollView(.horizontal, showsIndicators: false) {  // change
                        HStack {
                            
                            Button(action: {}) {
                                InfoSmallCard(category: "Muscle Group", text: "Chest", image: "", color: Color(.systemTeal), press: $press)
                            }.buttonStyle(PlainButtonStyle())
                            Button(action: {}) {
                                InfoSmallCard(category: "Exercise type", text: "Compound", image: "", color: Color(.systemPurple), press: $press)
                            }.buttonStyle(PlainButtonStyle())
                            Button(action: {showLocation.toggle()}) {
                                InfoSmallCard(category: "Equipment", text: selectedLocation?.name ?? "Gym", image: "", color: Color(.systemGreen), press: $press)
                            }.buttonStyle(PlainButtonStyle())
                            
                            
//                            InfoBigCard(category: "Muscle Group", text: "Chest", color: Color(.systemTeal))
//                            InfoBigCard(category: "Exercise Type", text: "Compound", color: Color(.systemPurple))
//                            InfoBigCard(category: "Equipment", text: "Gym", color: Color(.systemGray))
                            
                        }
                        .padding(.all, 10)
                        .padding(.bottom, 20)
                    }
                    }.padding(.top, 10)
                    HStack {
                        Text("Chest")
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .opacity(0.5)
                        Spacer()
                    }.padding(.leading)
                    
                ForEach(exercises) { exercise in
                    Button(action: { showDetail.toggle()}) {
                        ExercisesCard(exercise: exercise)
                    }.buttonStyle(PlainButtonStyle())
                }
                    
                    Spacer()
            }.opacity(showDetail ? 0 : 1)
            .animation(.linear)
            
            
            if showDetail {
                ExerciseDetail(showDetail: $showDetail)
                    .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                    .transition(.move(edge: .bottom))
            }
            
            if showLocation {
//                LocationSelectionView(
            }
            
        }
            
            
                
        
    }
}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView(showExercises: .constant(false), workout: Workout(context: PersistenceController.preview.container.viewContext)).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
