//
//  PresetExerciseRow.swift
//  CORE
//
//  Created by Jakub Ruranski on 27/07/2020.
//

import SwiftUI

struct PresetExerciseRow: View {
    var body: some View {
        HStack {
            
            Image("activityAbsDummy")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 75, height: 75, alignment: .center)
                .cornerRadius(25)
                .padding(.leading, 16)
            
            
            VStack(alignment: .leading) {
                HStack {
                    
                    HStack(spacing: 3.0) {
                        Image(systemName: "bag.fill")
                            .font(.system(size: 12, weight: .semibold, design: .rounded))
                        Text("Compound Movement")
                            .font(.system(size: 14, weight: .semibold, design: .rounded))
                    }
                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0.7494170666, blue: 0.811537087, alpha: 1)))
                    
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.system(size: 12, weight: .semibold, design: .rounded))
                        .opacity(0.5)
                }
                .padding(.trailing, 20)
                .padding(.top, 10)
                Spacer()
                Text("Squats")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                Spacer()
                Text("25x40kg")
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                    .padding(.bottom, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
            .frame(maxHeight: 75)
            
            
        }
        
        
    }
}

struct PresetExerciseRow_Previews: PreviewProvider {
    static var previews: some View {
        PresetExerciseRow()
    }
}
