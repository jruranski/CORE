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
            }
            Divider()
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
            }
            .padding(.horizontal, 10)
        }
        .padding(.all, 10)
        .frame(width: 350, height: 275, alignment: .center)
        .background(Color.white) // change for dm
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
//        .shadow(radius: 20)
        .modifier(ShadowModifier())
        
    }
}

struct WorkoutSummaryCard_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutSummaryCard()
    }
}
