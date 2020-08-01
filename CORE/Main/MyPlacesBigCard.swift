//
//  MyPlacesBigCard.swift
//  CORE
//
//  Created by Jakub Ruranski on 26/07/2020.
//

import SwiftUI

struct MyPlacesBigCard: View {
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Gym")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                        Text("Full Equipment")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                    
                }
                }
                .padding(.leading, 16)
                
                HStack {
                VStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: 90, height: 90, alignment: .center)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        .modifier(ShadowModifier())
                } //placeholder insert mapview
                
                
                VStack {
                    VStack {
                    Image(systemName: "bag")
                        .font(.system(size: 28, weight: .semibold, design: .rounded))
                        Text("Equipment")
                            .font(.system(size: 12, weight: .light, design: .rounded))
                    }
                        .frame(width: 90, height: 90, alignment: .center)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        .modifier(ShadowModifier())
                }
                    
                    VStack {
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: 90, height: 90, alignment: .center)
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                            .modifier(ShadowModifier())
                    }
                    
                }
                .padding(.leading, 16)
                
                
            }
            Spacer()
            
        }
        .frame(width: 330, height: 180)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .modifier(ShadowModifier())
        
    }
}

struct MyPlacesBigCard_Previews: PreviewProvider {
    static var previews: some View {
        MyPlacesBigCard()
    }
}
