//
//  ExercisesCard.swift
//  CORE
//
//  Created by Jakub Ruranski on 27/07/2020.
//

import SwiftUI

struct ExercisesCard: View {
    
    var exercise: Exercise?
    
    var logoImage: Image {
        
        //change for exercise equipment info weight workout bodyweight workout cardio
        
        return Image(systemName: "flame.fill")
    }
    
    var muscleString: String {
        let string = exercise?.muscle ?? "Compound Movement"
        
        //change to read from exercise muscle string
        return string
    }
    
    var color: Color = Color(.systemRed)
    var body: some View {
        HStack {
            
            Image(exercise?.gifName ?? "activityAbsDummy")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 105, height: 105, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .modifier(ShadowModifier())
                .padding(.leading)
            VStack(alignment: .leading) {
                HStack {
                    logoImage
                        .font(.system(size: 10, weight: .semibold, design: .rounded))
                        .foregroundColor(color)
                        .padding(.trailing, -5)
                    Text(exercise?.muscle ?? "Compound Movement")
                        .font(.system(size: 12, weight: .semibold, design: .rounded))
                        .foregroundColor(color)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.system(size: 14, weight: .semibold, design: .rounded))
                        .opacity(0.5)
                }.padding(.trailing)
                
                Text(exercise?.name ?? "Bench Press")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                
                HStack {
                    VStack {
                        Image(systemName: "play.circle.fill")
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                        Text("Play")
                            .font(.system(size: 10, weight: .semibold, design: .rounded))
                    }.frame(width: 55, height: 55, alignment: .center)
                    .background(Color(.systemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .modifier(ShadowModifier())
                    
                    Spacer()
                    VStack {
                        Image(systemName: "play.circle.fill")
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                        Text("Equipment")
                            .font(.system(size: 10, weight: .semibold, design: .rounded))
                    }.frame(width: 55, height: 55, alignment: .center)
                    .background(Color(.systemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .modifier(ShadowModifier())
                    
                    Spacer()
                    VStack {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                        Text("Add")
                            .font(.system(size: 10, weight: .semibold, design: .rounded))
                    }.frame(width: 55, height: 55, alignment: .center)
                    .background(Color(.systemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .modifier(ShadowModifier())
                }
                .padding(.trailing)
                
            }
        }
        .frame(width: screenWidth - 20, height: 140, alignment: .center)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .modifier(ShadowModifier())
    }
}

struct ExercisesCard_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesCard()
    }
}
