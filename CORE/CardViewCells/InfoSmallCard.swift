//
//  InfoSmallCard.swift
//  CORE
//
//  Created by Jakub Ruranski on 24/07/2020.
//

import SwiftUI

struct InfoSmallCard: View {
    
    var category = "Calories Goal"
    var text = "600kcal"
    var image = "flame.fill"
    var color = Color(.red)
    @State var tap: Bool = false
    @State var changeText: String = ""
    
    @Binding var press: Bool
    var body: some View {
        
        
        VStack(alignment: .leading, spacing: 2) {
            HStack(spacing: 2) {
                Image(systemName: image)
                    .font(.system(size:  9, weight: .semibold, design: .rounded))
                Text(press ? "Change Goal" : category)
                    .font(.system(size:  11, weight: .semibold, design: .rounded))
            }
            .foregroundColor(color)
            
//            Divider()
            
            
                Text(tap ? "Hold Press" : text)
                .font(.system(size: 18, weight: .bold, design: .rounded))
                
            
        }
        .animation(.easeIn)
        .padding(.all, 8)
        .frame(width:  125, height:  55, alignment: .leading)
        .background(Color.white) //change 4 dm
        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
        .shadow(color: Color.black.opacity(0.1), radius: 10, y: 5)
        .shadow(color: Color.black.opacity(0.1), radius: 1, y: 1)
        .scaleEffect(tap ? 0.9 : 1)
        
        .animation(.spring(response: 0.6, dampingFraction: 0.5, blendDuration: 0))
        .onTapGesture(count: 1, perform: {
            
        })
        .gesture(
            press ? nil
                : LongPressGesture(minimumDuration: 0.2, maximumDistance: 10)
                .onChanged { value in
                    
                    self.tap = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                        self.tap = false
                    })
                    
                }
                .onEnded { value in
                    self.press.toggle()
                }
            
        )
    }
}

struct InfoSmallCard_Previews: PreviewProvider {
    static var previews: some View {
        InfoSmallCard(press: .constant(false))
    }
}
