//
//  PastWorkoutCard.swift
//  CORE
//
//  Created by Jakub Ruranski on 27/07/2020.
//

import SwiftUI

struct PastWorkoutCard: View {
    var accentColor: Color = Color(#colorLiteral(red: 0, green: 0.7494170666, blue: 0.811537087, alpha: 1))
    
    @Binding var show: Bool
    @State var press: Bool = false
    var workout: Workout?
    
    var body: some View {     
        ZStack {
            HStack(spacing: 16) {
                Text(formatDateActivity(date: workout?.startDate ?? Date()))
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    
                VStack {
                VStack(alignment: .leading, spacing: 2) {
                    HStack {
                        HStack(spacing: 2) {
                            
                            Image(systemName: "mappin")
                                .font(.system(size: 12, weight: .bold, design: .rounded))
                            Text("Weight workout")
                                .font(.system(size: 14, weight: .semibold, design: .rounded))
                        }
                        .foregroundColor(accentColor)
                        
                        Spacer()
                        Image(systemName: "chevron.right")
                            .font(.system(size: 12, weight: .semibold, design: .rounded))
                            .opacity(0.6)
                            .padding(.trailing, 10)
                    }
                    .padding(.top, 10)
                    
                    
                    Text(workout?.name ?? "Full body workout")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                }
                .padding(.bottom, -20)
                .padding(.horizontal, 10)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            InfoSmallCard(category: "Start Time", text: formatTime(date: workout?.startDate ?? Date()), image: "clock",color: Color(.systemBlue), press: $press)
                                    .padding(.top)
                            InfoSmallCard(category: "Location", text: workout?.location?.name ?? "Gym", image: "mappin",color: Color(.systemGreen), press: $press)
                                    .padding(.top)
                            InfoSmallCard(category: "Exercises", text: "\(workout?.exercises?.count ?? 0)" , image: "list.number",color: Color(.systemYellow), press: $press)
                                    .padding(.top)
                            InfoSmallCard(category: "Duration", text: formatDuration(duration: workout?.duration ?? 0) , image: "hourglass",color: Color(.systemOrange), press: $press)
                                    .padding(.top)
                            InfoSmallCard(category: "Calorie Goal", text: "\(workout?.calories ?? 0)kcal" , image: "flame.fill",color: Color(.systemRed), press: $press)
                                    .padding(.top)
                            InfoSmallCard(category: "Finish Time", text: formatTime(date: workout?.endDate ?? Date().addingTimeInterval(3600)) , image: "clock.fill",color: Color(.systemIndigo), press: $press)
                                    .padding(.top)
                        }
                                        
        //                .frame(width: 350, height: 60, alignment: .center)
                        .padding(.bottom, 20)
                        .padding(.top, 10)
                        .padding(.leading, 10)
                        
                    }
                    
                    
                }
                
                .frame(width: 300, height: 155, alignment: .center)
                
                .background(Color.white) //change 4 dm
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(radius: 15, y: 10)
            }
            .background(Color(.systemBackground))
            
            
            
            
        }
        
    }
}

struct PastWorkoutCard_Previews: PreviewProvider {
    static var previews: some View {
        PastWorkoutCard(show: .constant(false))
    }
}
