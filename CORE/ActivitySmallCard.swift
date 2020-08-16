//
//  ActivitySmallCard.swift
//  CORE
//
//  Created by Jakub Ruranski on 21/07/2020.
//

import SwiftUI

struct ActivitySmallCard: View {
    
    var text = "Exercise Time"
    var numberText = "56MIN/DAY"
    var imageString = "arrowUpFilled"
    var color: UIColor = #colorLiteral(red: 0.8273431659, green: 0.2241420448, blue: 0.4397234917, alpha: 1)
    
    var body: some View {
        HStack {
            HStack {
                Image(imageString)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color(color))
                    .frame(width: 30, height: 30, alignment: .center)
                    .shadow(color: Color(color).opacity(0.2), radius: 10, y: 5)
                    
            }
            .frame(width: 36, height: 36, alignment: .center)
            .background(Color.white)
            .clipShape(Circle())
            .modifier(ShadowModifier())
            VStack(alignment: .leading) {
                Text(text)
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                Text(numberText)
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .foregroundColor(Color(color))
            }
        }
        .frame(width: 150, height: 65, alignment: .center)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        .shadow(color: Color(.label).opacity(0.2), radius: 15, y: 3)
    }
}

struct ActivitySmallCard_Previews: PreviewProvider {
    static var previews: some View {
        ActivitySmallCard()
    }
}
