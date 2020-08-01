//
//  ProfileView.swift
//  CORE
//
//  Created by Jakub Ruranski on 29/07/2020.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        
        
        VStack {
            
            HStack {
                Image(systemName: "chevron.left")
                    .font(.system(size: 24, weight: .semibold, design: .rounded))
                Spacer()
            }
            .padding()
            
            VStack {
                Image("activityAbsDummy")
                    .resizable()
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
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
