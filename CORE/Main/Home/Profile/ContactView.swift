//
//  ContactView.swift
//  CORE
//
//  Created by Jakub Ruranski on 07/09/2020.
//

import SwiftUI

struct ContactView: View {
    
     
    @Binding var showContact: Bool
    var logos = ["facebook", "instagram", "twitter", "gmail"]
    var body: some View {
        VStack {
            
            Text("We would love to hear from you!")
                
                .font(.system(size: 20, weight: .light, design: .rounded))
                .padding(.top)
            HStack {
                                ForEach(logos, id: \.self) { logo in
                                    Image(logo)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
            
                                        .frame(width: 48, height: 48, alignment: .center)
                                }
            }.padding(.top)
            
            Button(action: {showContact.toggle()}) {
                HStack {
                    Image(systemName: "xmark")
                        .font(.title)
                        .foregroundColor(.red)
                        .padding()
                }.frame(width: 64, height: 64, alignment: .center)
                .background(Color(.systemBackground))
                .clipShape(Circle())
                .modifier(ShadowModifier())
                .padding()
            }
            
        }
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView(showContact: .constant(true))
    }
}
