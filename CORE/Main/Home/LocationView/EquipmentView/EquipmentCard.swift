//
//  EquipmentCard.swift
//  CORE
//
//  Created by Jakub Ruranski on 27/07/2020.
//

import SwiftUI

struct EquipmentCard: View {
    
    var title: String = "EZBAR"
    var image: String = ""
    
    
    @State var selected: Bool
    @State private var scale: CGFloat = 0.2
    
    init(title: String, select: Bool) {
        _selected = State(initialValue: select)
        self.title = title
        self.image = ""
        print(selected)
    }
    
//    init(eq: Equipment) {
//        self.title = eq.name
//        self.image = eq.image
//        self.selected = eq.isPresent
//
//    }
//
    var body: some View {
//        VStack {
//            VStack {
//                Image(systemName: "circle")
//                    .foregroundColor(.white) // change
//                Text(title)
//                    .font(.system(size: 20, weight: .bold, design: .rounded))
//                    .foregroundColor(.white)
//                    .multilineTextAlignment(.center)
//                    .padding(.horizontal)
//            }
//            .frame(width: 150, height: 150, alignment: .center)
//            .background(
//                LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
//            )
//            .cornerRadius(30)
//            .shadow(color: Color.red.opacity(0.2), radius: 10, y: 5)
//        }
//        .frame(width: 160, height: 160, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        
        VStack {
            VStack {
                
                Image(systemName: "circle.fill")
                    .padding()
                    .aspectRatio(contentMode: .fit)
                Text(title)
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    .foregroundColor(selected ? .white : Color(.label))
                    .padding()
                    .multilineTextAlignment(.center)
            }
            .frame(width: 150, height: 150, alignment: .center)
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
        .frame(width: 160, height: 160, alignment: .center)
        .onTapGesture(count: 1, perform: {
            selected.toggle()
        })
        
        
    }
}

struct EquipmentCard_Previews: PreviewProvider {
    static var previews: some View {
        EquipmentCard(title: "", select: false)
    }
}
