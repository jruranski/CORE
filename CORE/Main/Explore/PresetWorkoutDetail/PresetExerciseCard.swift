//
//  PresetExerciseCard.swift
//  CORE
//
//  Created by Jakub Ruranski on 27/07/2020.
//

import SwiftUI

struct PresetExerciseCard: View {
    var exercise: Exercise?
    
    var body: some View {
        ZStack {
            
            Image(exercise?.gifName ?? "activityAbsDummy")
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            VStack {
                Spacer()
                HStack {
                    Text(exercise?.name ?? "Squats")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                    Spacer()
                    Image(systemName: "play.circle.fill")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                }
                .foregroundColor(Color(.systemBackground))
                .padding(.bottom, 20)
                .padding(.horizontal, 20)
            }
            .frame(width: 200, height: 200, alignment: .center)
        }
        .frame(width: 200, height: 200, alignment: .center)
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(radius: 10)
    
        
        
    }
}

struct PresetExerciseCard_Previews: PreviewProvider {
    static var previews: some View {
        PresetExerciseCard()
    }
}
