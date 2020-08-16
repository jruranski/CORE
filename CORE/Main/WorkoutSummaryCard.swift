//
//  WorkoutSummaryCard.swift
//  CORE
//
//  Created by Jakub Ruranski on 24/07/2020.
//

import SwiftUI

struct WorkoutSummaryCard: View {
    var body: some View {
        VStack(spacing: 10) {
            VStack {
            Text("59:36:23")
                .font(.system(size: 32, weight: .heavy, design: .rounded))
            Text("Total time")
                .font(.system(size: 20, weight: .medium, design: .rounded))
            }.padding(.bottom)
//            Divider()
            VStack {
                VStack(spacing: 10) {
                HStack {
                    
                VStack {
                Text("345kcal")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                Text("Active Calories")
                    .font(.system(size: 20, weight: .medium, design: .rounded))
                }
                    Spacer()
                VStack {
                Text("1300kg")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                Text("Total Weight")
                    .font(.system(size: 20, weight: .medium, design: .rounded))
                }
                    
                }
                
                HStack {
                    
                VStack {
                Text("425")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                Text("Total Calories")
                    .font(.system(size: 20, weight: .medium, design: .rounded))
                }
                    Spacer()
                VStack {
                Text("120BPM")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                Text("Heart Rate")
                    .font(.system(size: 20, weight: .medium, design: .rounded))
                }
                    
                }
                }.foregroundColor(.white)
                .padding(.horizontal, 10)
            }.background(
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .frame(width: 350, height: 180, alignment: .bottom)//add custom colors
                        .cornerRadius(8, corners: [.topLeft, .topRight])
                        .offset(y: 20)
                        
//                    Color.white.opacity(1)
//                        .frame(width: 350, height: 180, alignment: .bottom)//add custom colors
//                        .offset(y: 20)
////                        .background(Color.clear)
//                        .scaleEffect(0.8)
//                        .shadow(color: .white, radius: 20, x: 0.0, y: 0.0)
                }
            )
        }
        .padding(.all, 10)
        .frame(width: 350, height: 275, alignment: .center)
        .background(Color(.systemBackground)) // change for dm
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
//        .shadow(radius: 20)
        .shadow(color: Color(#colorLiteral(red: 0.9995438457, green: 0.4322041273, blue: 0.08174730092, alpha: 1)).opacity(0.15), radius: 10, y: 8)
        .shadow(color: Color(.label).opacity(0.2), radius: 1, y: -1)
        
    }
}

struct WorkoutSummaryCard_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutSummaryCard()
    }
}
