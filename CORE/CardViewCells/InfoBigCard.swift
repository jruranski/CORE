//
//  InfoBigCard.swift
//  CORE
//
//  Created by Jakub Ruranski on 25/07/2020.
//

import SwiftUI

struct InfoBigCard: View {
    
    var category = "Sets"
    var text = "4"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack(spacing: 2) {
                
                Text(category)
                    .font(.system(size: 18, weight: .semibold, design: .rounded))
            }
            .foregroundColor(.red)
            
//            Divider()
            Text(text)
                .font(.system(size: 22, weight: .bold, design: .rounded))
            
        }
        .padding(.all, 8)
        .frame(width: 100, height: 70, alignment: .leading)
        .background(Color.white) //change 4 dm
        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
        .shadow(color: Color.black.opacity(0.1), radius: 10, y: 5)
        .shadow(color: Color.black.opacity(0.1), radius: 1, y: 1)
    }
}

struct InfoBigCard_Previews: PreviewProvider {
    static var previews: some View {
        InfoBigCard()
    }
}
