//
//  BigWorkoutCard.swift
//  CORE
//
//  Created by Jakub Ruranski on 22/07/2020.
//

import SwiftUI

struct BigWorkoutCard: View {
    
    
    
    
    
    
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Full on Burn") // add custom string
                        .font(.system(size: 26,weight: .bold, design: .rounded))
                    Text("No pain no gain!") // add custom string
                        .font(.system(size: 14, weight: .medium, design: .rounded))
                }
                .foregroundColor(.white)
                
                Spacer()
                
                Image(systemName: "bolt.heart") // add custom string
                    .foregroundColor(.red)
                    .font(.system(size: 20, weight: .medium))
                    .frame(width: 36, height: 36, alignment: .center)
                    .background(Color.white)
                    .clipShape(Circle())
                    .modifier(ShadowModifier())
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
            
            Spacer()
            Image("aiRobotCard") // add custom string
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 110, alignment: .center)
        }
        .frame(width: 315, height: 210, alignment: .center)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing) //add custom colors
        )
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)).opacity(0.2), radius: 20, y: 15)
    }
}

struct BigWorkoutCard_Previews: PreviewProvider {
    static var previews: some View {
        BigWorkoutCard()
    }
}
