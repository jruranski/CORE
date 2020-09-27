//
//  ExploreSmallCard.swift
//  CORE
//
//  Created by Jakub Ruranski on 21/07/2020.
//

import SwiftUI

struct ExploreSmallCard: View {
    
    var title: String = "Full on Burn"
    var subtitle: String = "No pain No gain!"
    var logo: Image = Image(systemName: "bolt.heart")
    var image: Image = Image("aiRobotCard")
    
    var color1 = Color.red
    var color2 = Color.orange
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.system(size: 26,weight: .bold, design: .rounded))
                    Text(subtitle)
                        .font(.system(size: 14, weight: .medium, design: .rounded))
                }
                .foregroundColor(.white)
                
                Spacer()
                
                logo
                    .foregroundColor(color1)
                    .font(.system(size: 20, weight: .medium))
                    .frame(width: 36, height: 36, alignment: .center)
                    .background(Color(.systemBackground))
                    .clipShape(Circle())
                    .modifier(ShadowModifier())
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
            
            Spacer()
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 110, alignment: .center)
        }
        .frame(width: 240, height: 210, alignment: .center)
        .background(
            LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: color1.opacity(0.2), radius: 20, y: 15)
    }
}

struct ExploreSmallCard_Previews: PreviewProvider {
    static var previews: some View {
        ExploreSmallCard()
    }
}
