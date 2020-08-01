//
//  EquipmentCard.swift
//  CORE
//
//  Created by Jakub Ruranski on 27/07/2020.
//

import SwiftUI

struct EquipmentCard: View {
    var body: some View {
        VStack {
            Image(systemName: "circle")
                .foregroundColor(.white) // change
            Text("Ez-Bar")
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundColor(.white)
        }
        .frame(width: 150, height: 150, alignment: .center)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .cornerRadius(30)
        .shadow(color: Color.red.opacity(0.2), radius: 10, y: 5)
    }
}

struct EquipmentCard_Previews: PreviewProvider {
    static var previews: some View {
        EquipmentCard()
    }
}
