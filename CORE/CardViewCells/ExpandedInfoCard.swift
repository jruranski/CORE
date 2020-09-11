//
//  ExpandedInfoCard.swift
//  CORE
//
//  Created by Jakub Ruranski on 11/09/2020.
//

import SwiftUI

struct ExpandedInfoCard: View {
    
    @Binding var press: Bool
    var text: String = "600kcal"
    var image = "flame.fill"
    var category = "Calories Goal"
    @State var changeText: String = ""
    var body: some View {
        VStack {
            VStack(alignment: press ? .center : .leading, spacing: 2) {
                HStack(spacing: 2) {
                    Image(systemName: image)
                        .font(.system(size: press ? 18 : 9, weight: .semibold, design: .rounded))
                    Text(press ? "Change Goal" : category)
                        .font(.system(size: press ? 20 : 11, weight: .semibold, design: .rounded))
                }
                .foregroundColor(.red)
                
                TextField(text, text: $changeText)
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .multilineTextAlignment(.center)
                    .padding()
//                    .hideKeyboard()
                Button(action: {press.toggle()}) {
                    VStack {
                        Text("Save")
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                    }.frame(width: 250, height: 50, alignment: .center)
                    .background(Color(.systemRed))
                    .cornerRadius(25)
                    .shadow(color: Color.red.opacity(0.3), radius: 10, x: 0.0, y: 5)
                    
                }
                
                
                
                
                
            }
                .animation(.easeIn)
                .padding(.all, 8)
                .frame(width: press ? 320 : 125, height: press ? 200 : 55, alignment: .leading)
                .background(Color.white) //change 4 dm
                .clipShape(RoundedRectangle(cornerRadius: press ? 30 : 15, style: .continuous))
                .shadow(color: Color.black.opacity(0.1), radius: 10, y: 5)
                .shadow(color: Color.black.opacity(0.1), radius: 1, y: 1)
                .offset(y: press ? -50 : 0)
                .animation(.spring(response: 0.6, dampingFraction: 0.5, blendDuration: 0))
            
        }
        
}
}
struct ExpandedInfoCard_Previews: PreviewProvider {
    static var previews: some View {
        ExpandedInfoCard(press: .constant(true))
    }
}
