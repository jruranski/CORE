//
//  WorkoutView.swift
//  CORE
//
//  Created by Jakub Ruranski on 24/07/2020.
//

import SwiftUI

struct WorkoutView: View {
    @State var workoutStarted: Bool = false
    @State var workoutRunning: Bool = false
    @State var showDetail: Bool = false
    @State var showAdd: Bool
    @Binding var showWorkout: Bool
    
    
    var workout: Workout?
    
    var body: some View {
        ZStack {
             NavigationView {
                ScrollView {
                    VStack {
                        if workoutStarted {
                        WorkoutSummaryCard()
                            .padding(.top, 10)
                        }else{
                            StartButtons(started: $workoutStarted, running: $workoutRunning)
                                .padding()
                        }
//                        ForEach((workout?.exercises)!) { exercise in
                        Button(action: {showDetail.toggle()}) {
                        ExerciseWorkoutCard()
                        }.buttonStyle(PlainButtonStyle())
//                        }
                        Spacer()
                        
                        workoutStarted ? StartButtons(started: $workoutStarted, running: $workoutRunning) : nil
                    }
                    
                    
                    
                    
                    .navigationBarTitle(Text(workout?.name ?? "Workout")
                                            
                    )
                    .navigationBarItems(leading:
                                            workoutStarted ? nil :
                                            Button(action: {showWorkout.toggle()}) {
                                                Image(systemName: "chevron.left")
                                                    .font(.system(size: 22, weight: .medium, design: .rounded))
                                                    .foregroundColor(Color(.label))
                        }
                                        ,trailing:
                                            
                                            HStack {
                                                
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
                                                
                                                
                                                NavigationLink(destination: ExercisesView()) {
                                                    Image(systemName: "plus")
                                                        .renderingMode(.original)
                                                        .font(.system(size: 18, weight: .bold, design: .rounded))
                                                        //                .aspectRatio(contentMode: .fit)
                                                        .padding(.all,  2)
                                                        .frame(width: 36, height: 36, alignment: .center)
                                                        .background(Color.white)
                                                        .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
                                                        .modifier(ShadowModifier())
                                                }.navigationBarTitle(Text("Exercises"), displayMode: .large)
                                            }
                                        
                                        
                    )
                    
                    
                }.frame(width: 375)
                .frame(maxWidth: .infinity)
             }.animation(.easeInOut)
            if showDetail {
                WorkoutDetail(showDetail: $showDetail)
                    .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                    .transition(.move(edge: .bottom))
            }
        }
        
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView(showAdd: false, showWorkout: .constant(false))
    }
}

struct StartButtons: View {
    
    @Binding var started: Bool
    @Binding var running: Bool
    
    func changeStates(pauseButton: Bool, start: Bool, running: Bool) {
        if pauseButton {
        if start == true && running == false {
            //unpause workout
            self.started = true
            self.running = true
        }else if start == false {
            // start workout
            self.started = true
            self.running = true
        }else if start == true && running == false {
            // unpause wokrout
            self.started = true
            self.running = true
        }else if start == true && running == true {
            // pause workout
            self.started = true
            self.running = false
        }
        }else{
            // end workout
            self.started = false
            self.running = false
        }
    }
    
    var body: some View {
        HStack {
            if running == false {
            started ?
            VStack {
                Button(action: {changeStates(pauseButton: false, start: started, running: running)}) {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .font(.system(size:24, weight: .bold, design: .rounded))
                }
            }.frame(width: started ? 64 : 0, height: started ? 64 : 0, alignment: .center)
            .background(Color(.systemRed))
            .cornerRadius(16)
            .shadow(color: Color.red.opacity(0.2), radius: 10, x: 0.0, y: 8)
                : nil
                
            }
            if running == false {
            started ? Spacer() : nil
            }
            Button(action: {changeStates(pauseButton: true, start: started, running: running)}) {
            VStack {
                
                    Image(systemName: started ? (running ? "pause" : "play.fill") : "play.fill")
                        .foregroundColor(.white)
                        .font(.system(size:28, weight: .bold, design: .rounded))
                }
            }
            .frame(width:started ? 350 : 350, height: 64, alignment: .center)
            
            .frame(width: started ? (running ? 350 : 256) : 350)
            
            .background(Color(.systemGreen))
            .cornerRadius(started ? 16 : 32)
            .shadow(color: Color.green.opacity(0.3), radius: 20, x: 0.0, y: 8)
        }.padding(.horizontal, 16)
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        
    }
}
