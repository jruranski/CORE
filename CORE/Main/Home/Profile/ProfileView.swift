//
//  ProfileView.swift
//  CORE
//
//  Created by Jakub Ruranski on 29/07/2020.
//

import SwiftUI

struct ProfileView: View {
    
    @Binding var showProfile: Bool
    
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
                Image("activityAbsDummy")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150, alignment: .center)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                Text("Jack")
                    .font(.system(size: 32, weight: .bold, design: .rounded))
            }
            
            
            List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                Text("Account")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .padding(8)
            }
            .clipShape(RoundedRectangle(cornerRadius: 30.0))
            .shadow(radius: 20)
        }.background(Color(.systemBackground))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(showProfile: .constant(false))
    }
}
