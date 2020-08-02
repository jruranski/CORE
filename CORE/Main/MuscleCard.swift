//
//  MuscleCard.swift
//  CORE
//
//  Created by Jakub Ruranski on 02/08/2020.
//

import SwiftUI

struct MuscleCard: View {
    var body: some View {
        VStack {
            VStack {
                
                Image(systemName: "circle.fill")
                    .padding()
                    .aspectRatio(contentMode: .fit)
                Text("Chest")
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
                    .padding()
            }
            .frame(width: 120, height: 120, alignment: .center)
            .background(Color(.systemBlue))
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: Color.blue.opacity(0.1), radius:  10, y: 2)
        }
        .frame(width: 130, height: 130, alignment: .center)
        
    }
}

struct MuscleCard_Previews: PreviewProvider {
    static var previews: some View {
        MuscleCard()
    }
}
