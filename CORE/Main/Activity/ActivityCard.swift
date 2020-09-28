//
//  ActivityCard.swift
//  CORE
//
//  Created by Jakub Ruranski on 27/07/2020.
//

import SwiftUI

struct ActivityCard: View {
    
    var totalWeight = ""
    var totalTime = ""
    var totalWorkouts = ""
    var avgWorkout = ""
    var avgWeight = ""
    
    var body: some View {
        VStack {
            VStack(spacing: 16) {
                VStack {
                    Text("Total Weight Lifted")
                        .font(.system(size: 14, weight: .medium, design: .rounded))
                    
                    Text(totalWeight)
                        .font(.system(size: 48, weight: .heavy, design: .rounded))
                        .padding(8)
                }
                
                HStack {
                    VStack {
                        Text(totalTime)
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                        Text("Total Time")
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                    }
                    Spacer()
                    VStack {
                        Text(totalWorkouts)
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                        Text("Total Workouts")
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                    }
                }
                .padding(.horizontal, 30)
                .padding(.top, 10)
                HStack {
                    VStack {
                        Text(avgWorkout)
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                        Text("Avg. Workout")
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                    }
                    Spacer()
                    VStack {
                        Text(avgWeight)
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                        Text("Avg. Weight")
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                    }
                }
                .padding(.horizontal, 30)
                .padding(.top, 10)
                
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(30)
            .modifier(ShadowModifier())
//            .padding(.horizontal, 8)
        }
    }
}

struct ActivityCard_Previews: PreviewProvider {
    static var previews: some View {
        ActivityCard()
    }
}
