//
//  MuscleCard.swift
//  CORE
//
//  Created by Jakub Ruranski on 02/08/2020.
//

import SwiftUI

struct MuscleCard: View {
    
    var title: String = "Chest"
    var image: String = ""
    
    @State private var selected: Bool = false
    @State private var scale: CGFloat = 0.2
    var body: some View {
        VStack {
            VStack {
                
                Image(systemName: "circle.fill")
                    .padding()
                    .aspectRatio(contentMode: .fit)
                Text(title)
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    .foregroundColor(selected ? .white : Color(.label))
                    .padding()
            }
            .frame(width: 120, height: 120, alignment: .center)
            .background(selected ?
                            Color(.systemRed) :
                            Color(.systemGray5)
            )
            .clipShape(RoundedRectangle(cornerRadius: selected ? 30 : 20, style: .continuous))
            .shadow(color: Color.gray.opacity(0.1), radius:  10, y: 2)
            .overlay(
                selected ?
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .medium, design: .rounded))
                    .scaleEffect(scale)
                    .onAppear {
                        scale = 1
                    }
                    .onDisappear {
                        scale = 0.2
                    }
                    .animation(Animation.spring(response: 0.5, dampingFraction: 0.3, blendDuration: 0)
                                )
                    
                :nil
            )
            .scaleEffect(selected ? 0.95 : 1)
            .animation(.spring(response: 0.8, dampingFraction: 0.8, blendDuration: 0))
        }
        .frame(width: 130, height: 130, alignment: .center)
        .onTapGesture(count: 1, perform: {
            selected.toggle()
        })
        
    }
}

struct MuscleCard_Previews: PreviewProvider {
    static var previews: some View {
        MuscleCard()
    }
}
