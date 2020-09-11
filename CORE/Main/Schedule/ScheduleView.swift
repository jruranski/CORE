//
//  ScheduleView.swift
//  CORE
//
//  Created by Jakub Ruranski on 23/07/2020.
//

import SwiftUI

class WeekdaySection {
    var id: Int
    var name: String
    var workouts: [Workout]
    
    init(id: Int, name: String, workouts: [Workout]) {
        self.id = id
        self.name = name
        self.workouts = workouts
    }
}


struct ScheduleView: View {
    
    @FetchRequest(entity: Workout.entity(), sortDescriptors: []) var workouts: FetchedResults<Workout>
    
    var weekdaysStrings = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    var weekdays: [WeekdaySection] = []
    @State var showAdd: Bool = false
    @State var showWorkout: Bool = false
    @State var press: Bool = false
    
     func getSection() -> [WeekdaySection]{
        var weekdays: [WeekdaySection] = []
//        var formattedString: String?
        
        let date = Date()
//        let formatter = DateFormatter()
        let startDate = date.dayOfWeek() ?? "Monday"
        let index = weekdaysStrings.firstIndex(of: startDate)
        var inx = 0
        
        for i in weekdaysStrings.indices {
            if i < index! {
                weekdays.append(WeekdaySection(id: weekdaysStrings.count - inx, name: weekdaysStrings[i], workouts: []))
            }else if i == index {
                weekdays.insert(WeekdaySection(id: 0, name: startDate, workouts: []), at: 0)
                inx += 1
            }else if i > index! {
                weekdays.insert(WeekdaySection(id: inx, name: weekdaysStrings[i], workouts: []), at: inx)
                inx += 1
            }
            
        }
        return weekdays
    }
    
    
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                VStack {
                        HStack {
                            Text("Schedule")
            //                    .padding()
                                .font(.system(size: 30, weight: .bold, design: .rounded))
                            Spacer()
                            
                            
                            
                            Button(action: {}, label: {
                                HStack(spacing: 2) {
                                    
                                    Text("Edit")
                                        .foregroundColor(.black) // change for dmode
                                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                                        .frame(width: 48, height: 36, alignment: .center)
                                }
                //                .padding(.horizontal, 10)
                                .frame(width: 54, height: 36, alignment: .center)
                                .padding(.horizontal, 16)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                //                .shadow(color: Color.black.opacity(0.3), radius: 15, y: 6)
                                .modifier(ShadowModifier())
                                
                            })
                            
                            Button(action: {showAdd.toggle()
                                print("showAdd")
                            }) {
                            Image(systemName: "plus")
                                .renderingMode(.original)
                                .font(.system(size: 18, weight: .bold, design: .rounded))
                //                .aspectRatio(contentMode: .fit)
                                .padding(.all,  2)
                                .frame(width: 36, height: 36, alignment: .center)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
                                .modifier(ShadowModifier())
                            }
                            
                        }
                        
                        
                        
                        
                        
                        
                        
                        
                    }
                    .padding(.horizontal, 10)
                    .padding(.leading , 14)
                .padding(.top, 30)
                
                    ForEach(weekdays, id: \.id) { weekday in
                HStack {
                    Text(weekday.name)
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .opacity(0.4)
                    Spacer()
                }
                .padding(.all, 10)
                .padding(.leading, 14)
                        ForEach(weekday.workouts) { workout in
                Button(action: { showWorkout.toggle()}) {
                    BigScheduleCard(press: $press)
                }
                .buttonStyle(PlainButtonStyle())
                        }
                    }
                
                
                
                Spacer()
            }.opacity(showAdd ? 0 : 1)
            .opacity(showWorkout ? 0 : 1)
            .animation(.easeInOut)
            }
            
            if showAdd {
                AddNewWorkoutView(showAdd: $showAdd, showDetail: false)
                    .animation(.easeInOut(duration: 0.2))
                    .transition(.move(edge: .trailing))
            }
            
            if showWorkout {
                WorkoutView(showAdd: false, showWorkout: $showWorkout)
                    .animation(.easeInOut(duration: 0.2))
                    .transition(.move(edge: .trailing))
            }
            
        }.onAppear {
//            weekdays = getSection()
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView(showAdd: false)
    }
}
