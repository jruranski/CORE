//
//  ContentView.swift
//  CORE
//
//  Created by Jakub Ruranski on 19/07/2020.
//

import SwiftUI
import CoreData

struct HomeView: View {
    
    @Environment(\.managedObjectContext) private var managedObjectContext
        
    @FetchRequest(entity: Location.entity(), sortDescriptors: []) private var locations: FetchedResults<Location>
    @FetchRequest(entity: Workout.entity(), sortDescriptors: []) private var workouts: FetchedResults<Workout>
    @FetchRequest(entity: Preset.entity(), sortDescriptors: []) private var presets: FetchedResults<Preset>
    
    
    @State var showProfile: Bool = false
    @State var showLocations: Bool = false
    @State var showWorkout: Bool = false
    @State var showArticle: Bool = false
    
    var workout: Workout?
    
    
    var activityStrings = ["Exercise Time", "Weight Lifted", "Avg. Workout", "Burned Calories", "No. Workouts", "Daily Steps"]
    var activityDescripttions = ["64MIN/DAY", "5600KG", "54MIN", "754KCAL/DAY", "5", "10 435/DAY"]
    var activityColors: [UIColor] = [.systemOrange, .systemTeal, .systemPurple, .systemRed, .systemBlue, .systemGray]
    var activityState: [ArrowState] = [.up, .up, .down, .down, .noChange, .up, .down]
    
    var body: some View {
//        NavigationView {
        ZStack {
            ScrollView {
                VStack {
                    VStack {
                            HStack {
                                Text("Today")
                //                    .padding()
                                    .font(.system(size: 30, weight: .bold, design: .rounded))
                                Spacer()
                                Button(action: {showProfile.toggle()
                                    print("showProfile")
                                }) {
                                Image(systemName: "person.crop.circle.fill")
                                    .renderingMode(.original)
                                    .font(.system(size: 18))
                    //                .aspectRatio(contentMode: .fit)
                                    .padding(.all,  2)
                                    .frame(width: 36, height: 36, alignment: .center)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .modifier(ShadowModifier())
                                }.buttonStyle(PlainButtonStyle())
                                Button(action: {showLocations.toggle()}) {
                                    HStack(spacing: 2) {
                                        Image(systemName: "mappin.circle.fill")
                                            .resizable()
                                            .foregroundColor(.black) // need to change to darkmode
                                            .frame(width: 18, height: 18, alignment: .center)
                                        Text("Gym")
                                            .foregroundColor(.black) // change for dmode
                                            .font(.system(size: 18, weight: .semibold, design: .rounded))
                                            .frame(width: 48, height: 36, alignment: .center)
                                    }.buttonStyle(PlainButtonStyle())
                    //                .padding(.horizontal, 10)
                                    .frame(width: 54, height: 36, alignment: .center)
                                    .padding(.horizontal, 16)
                                    .background(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    //                .shadow(color: Color.black.opacity(0.3), radius: 15, y: 6)
                                    .modifier(ShadowModifier())
                                    
                                }
                            }
                            
                            
                            
                            
                            
                            
                            
                            
                        }
                        .padding(.horizontal, 10)
                        .padding(.leading , 14)
                    .padding(.top, 30)
                    
                    
                    Text("Good morning Jack! You have a workout planned for today, shall we get started?")
                        .padding(.all, 10)
                        .font(.system(size: 16,weight: .medium, design: .rounded))
                        .opacity(0.8)
                        
                    if workoutToday() {
                        StartWorkoutCard(showWorkout: $showWorkout)
                        .padding(.vertical, 20)
                    }
                    
                    
                    SmallTitle(text: "Recommended", description: "Discover new workouts")
                    
                    
                    
                    // discover section
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(1..<4) { _ in
                                
                                GeometryReader { geometry in
//                                    NavigationLink(destination: )
                                    ExploreSmallCard()
                                        .rotation3DEffect(
                                            .degrees(Double(geometry.frame(in: .global).minX - 30) / -20),
                                            axis: (x: 0.0, y: 10.0, z: 0.0),
                                            anchor: .center,
                                            anchorZ: 0.0,
                                            perspective: 1.0
                                        )
                                }
                                .frame(width: 250, height: 275, alignment: .center)
                            }
                        }
                        .padding(.all, 20)
                        .padding(.top, -20)
                        .padding(.bottom, -40)
                    }
                    
                    SmallTitle(text: "Learn", description: "Check your progress since last week")
                    
                    VStack {
                        ForEach(activityStrings.indices) {index in
                            HStack(spacing: 20) {
                                if index % 2 == 0 {
                                ActivitySmallCard(text: activityStrings[index], numberText: activityDescripttions[index], imageString: "arrowUpFilled", color: activityColors[index], state: activityState[index])
                                    ActivitySmallCard(text: activityStrings[index + 1], numberText: activityDescripttions[index + 1], imageString: "arrowUpFilled", color: activityColors[index + 1], state: activityState[index + 1])
                                }
                            }
                        }
                        .padding(.vertical, 5)
                    }
                    .padding(.vertical, 10)
                    
                    
                    SmallTitle(text: "Learn", description: "The best techniques and tips from our experts")
                    
                    Button(action: {showArticle.toggle()}) {
                    ArticleCardView()
                    }.buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                    
                    
                }
            }.opacity(showProfile ? 0 :1 )
            .opacity(showLocations ? 0 : 1)
            .opacity(showWorkout ? 0 : 1)
            .opacity(showArticle ? 0 : 1)
            .animation(.linear)
            
            
            if showLocations {
                MyPlacesView(showLocations: $showLocations)
                    .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0))
                    .transition(.move(edge: .top))
            }
            
            if showProfile {
                ProfileView(showProfile: $showProfile)
                    .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0))
                    .transition(.move(edge: .top))
            }
            if showWorkout {
                WorkoutView(showAdd: false, showWorkout: $showWorkout)
                    .animation(.easeInOut(duration: 0.2))
                    .transition(.move(edge: .trailing))
            }
            if showArticle {
                ArticleView(show: $showArticle, articleName: "Cardio alone won't help you lose fat", articleText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vel porttitor enim, eu maximus lacus. Suspendisse odio mauris, sodales at quam nec, mollis auctor erat. Nulla ut nunc luctus, luctus purus vel, suscipit turpis")
                    .animation(.easeInOut(duration: 0.2))
                    .transition(.move(edge: .trailing))
            }
        }
            
//        }
            
            
    }
    
     func workoutToday() -> Bool {
        var isWorkoutDay = false
        
        for i in workouts {
            if Calendar.autoupdatingCurrent.isDateInToday(i.startDate ?? Date().addingTimeInterval(360000)) {
                isWorkoutDay = true
                
            }
        }
        
        
        return isWorkoutDay
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
