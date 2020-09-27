//
//  BigWorkoutCard.swift
//  CORE
//
//  Created by Jakub Ruranski on 22/07/2020.
//

import SwiftUI

struct BigWorkoutCard: View {
    
    var title: String = "Full on Burn"
    var subtitle: String = "The app will create a workout customized just for you"
    var image: String = "aiRobotCard"
    var logo: Image = Image(systemName: "bolt.heart")
    
    var startingColor: UIColor = #colorLiteral(red: 1, green: 0, blue: 0.4162199199, alpha: 1)
    var endColor: UIColor = #colorLiteral(red: 0.9772351384, green: 0.6079230905, blue: 0, alpha: 1)
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(title) // add custom string
                        .font(.system(size: 26,weight: .bold, design: .rounded))
                    Text(subtitle) // add custom string
                        .font(.system(size: 14, weight: .medium, design: .rounded))
                }
                .foregroundColor(.white)
                
                Spacer()
                
                logo 
                    .foregroundColor(Color(startingColor))
                    .font(.system(size: 20, weight: .medium))
                    .frame(width: 36, height: 36, alignment: .center)
                    .background(Color.white)
                    .clipShape(Circle())
                    .modifier(ShadowModifier())
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
            
            Spacer()
            Image(image) // add custom string
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 110, alignment: .center)
        }
        .frame(width: 315, height: 240, alignment: .center)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color(startingColor), Color(endColor)]), startPoint: .topLeading, endPoint: .bottomTrailing) //add custom colors
        )
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: Color(endColor).opacity(0.2), radius: 20, y: 15)
    }
}

struct BigWorkoutCard_Previews: PreviewProvider {
    static var previews: some View {
        BigWorkoutCard()
    }
}
