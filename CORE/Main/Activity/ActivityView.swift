//
//  ActivityView.swift
//  CORE
//
//  Created by Jakub Ruranski on 27/07/2020.
//

import SwiftUI

struct ActivityView: View {
    
    
    @Environment(\.managedObjectContext) private var managedObjectContext
        
//    @FetchRequest(entity: Location.entity(), sortDescriptors: []) private var locations: FetchedResults<Location>
    @FetchRequest(entity: Workout.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Workout.startDate, ascending: false)]) private var workouts: FetchedResults<Workout>
//    @FetchRequest(entity: Preset.entity(), sortDescriptors: []) private var presets: FetchedResults<Preset>
    
    @State var press: Bool = false
    
    var body: some View {
        ZStack {
            NavigationView {
                ScrollView {
                    VStack(spacing: 30) {
                        ActivityCard(totalWeight: "", totalTime: "", totalWorkouts: "\(workouts.count)", avgWorkout: "", avgWeight: "") //  change to reflect real values
                            .padding(.horizontal, 8)
                        VStack(spacing: 0) {
                        ActivitySeparator()
                            .padding(.bottom, 10)
                            .padding(.top, 10)
                            ForEach(workouts) { workout in
                                LazyVStack(spacing: 20) {
                                    NavigationLink(
                                        destination: PastWorkoutDetail()) {
                                        PastWorkoutCard(show: $press, workout: workout)
                                    }.buttonStyle(PlainButtonStyle())
                                .padding(.bottom, 30)
                                    
                                }
                            }
                        }
                    }
                    .padding(.top, 30)
                }
                .onAppear {
                    UITableView.appearance().separatorStyle = .none
            }
                .navigationBarTitle(Text("Activity"))
            }
            if press {
                ExpandedInfoCard(press: $press)
                    .transition(.move(edge: .bottom))
                    .animation(.spring(response: 0.6, dampingFraction: 0.4, blendDuration: 0))
            }
            
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
