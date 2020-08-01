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
    
    
    var body: some View {
        
        
        VStack(alignment: .leading, spacing: 2) {
            HStack(spacing: 2) {
                Image(systemName: image)
                    .font(.system(size: 9, weight: .semibold, design: .rounded))
                Text("Calories Goal")
                    .font(.system(size: 11, weight: .semibold, design: .rounded))
            }
            .foregroundColor(.red)
            
//            Divider()
            Text(text)
                .font(.system(size: 18, weight: .bold, design: .rounded))
            
        }
        .padding(.all, 8)
        .frame(width: 125, height: 55, alignment: .leading)
        .background(Color.white) //change 4 dm
        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
        .shadow(color: Color.black.opacity(0.1), radius: 10, y: 5)
        .shadow(color: Color.black.opacity(0.1), radius: 1, y: 1)
        
    }
}

struct InfoSmallCard_Previews: PreviewProvider {
    static var previews: some View {
        InfoSmallCard()
    }
}
