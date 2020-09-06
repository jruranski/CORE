//
//  ProfileView.swift
//  CORE
//
//  Created by Jakub Ruranski on 29/07/2020.
//

import SwiftUI

struct ProfileView: View {
    
    @Binding var showProfile: Bool
    var items = ["Profile", "Account", "Settings", "Info", "Contact"]
    var icons = ["person.circle", "creditcard.circle", "gear", "info.circle", "envelope.circle"]
    var logos = ["facebook", "instagram", "twitter", "gmail"]
    
    var body: some View {
        
        
        VStack {
            
            HStack {
                Button(action: {showProfile.toggle()}) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 24, weight: .semibold, design: .rounded))
                    .foregroundColor(Color(.label))
                }.buttonStyle(PlainButtonStyle())
                Spacer()
            }
            .padding()
            
            
            
            
            VStack {
                List(items.indices) { item in
                    HStack {
                        Image(systemName: icons[item])
                            .font(.system(size: 28, weight: .light))
                        Text(items[item])
                            .font(.system(size: 28, weight: .semibold, design: .rounded))
                            .padding(8)
                    }
                }.padding()
                .offset(y:50)
            }
            .frame(width: 350, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 30.0))
            .shadow(radius: 20)
            .overlay(
                
                HStack {
                    Image("activityAbsDummy")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 128, height: 128, alignment: .center)
                        .clipShape(Circle())
                    
                }.offset(y: -200)
                .shadow(radius: 10)
            )
            HStack {
                ForEach(logos, id: \.self) { logo in
                    Image(uiImage: UIImage(named: logo) ?? UIImage())
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        
                        .frame(width: 48, height: 48, alignment: .center)
                }
            }
            
            
        }.background(Color(.systemBackground))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(showProfile: .constant(false))
    }
}
