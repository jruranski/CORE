//
//  ExerciseWorkoutCard.swift
//  CORE
//
//  Created by Jakub Ruranski on 25/07/2020.
//

import SwiftUI

struct ExerciseWorkoutCard: View {
    
    @Binding var press: Bool
    
    
    var body: some View {
        ZStack {
            
            VStack {
                VStack {
                    Image("activityAbsDummy")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 350, height: 150, alignment: .center)
                        Spacer()
                }
                
                .frame(width: 350, height: 250, alignment: .center)
                
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .modifier(ShadowModifier())
            }
            .offset(x: 0, y: -50)
            
            
            VStack {
                VStack {
                    HStack {
                        Text("Squats")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .padding(.leading, 16)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .font(.system(size: 12, weight: .semibold, design: .rounded))
                            .opacity(0.6)
                            .padding(.trailing, 10)
                    }
                    .padding(.top, 20)
                    
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(1..<5) { _ in
                                InfoSmallCard(category: "Calories Goal", text: "600kcal", image: "flame.fill", press: $press)
                            }
                        }
                                        
        //                .frame(width: 350, height: 60, alignment: .center)
                        .padding(.bottom, 20)
    //                    .padding(.top, 10)
                        .padding(.leading, 10)
                        
                    }
                }
    //            .padding(.all, 10)
                
            }
            .frame(width: 350, height: 120, alignment: .center)
            .background(Color.white) //change 4 dm
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .modifier(ShadowModifier())
        }
        .offset(x: 0, y: 50)
    }
}

struct ExerciseWorkoutCard_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseWorkoutCard(press: .constant(false))
    }
}
