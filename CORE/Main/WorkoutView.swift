//
//  WorkoutView.swift
//  CORE
//
//  Created by Jakub Ruranski on 24/07/2020.
//

import SwiftUI

struct WorkoutView: View {
    
    @State var showAdd: Bool
    
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
                    .navigationBarItems(trailing:
                                                                    
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
            }
        }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView(showAdd: false)
    }
}
