//
//  SmallTitle.swift
//  CORE
//
//  Created by Jakub Ruranski on 21/07/2020.
//

import SwiftUI

struct SmallTitle: View {
    
    var text: String = "Recommended"
    var description: String = "Discover new workouts"
    
    var body: some View {
        VStack {
            HStack {
            Text(text)
                .font(.system(size: 20,weight: .bold, design: .rounded))
                
                Spacer()
            }
            .padding(.horizontal, 10)
            
            HStack {
                Text(description)
                    .font(.system(size: 28, weight: .bold ,design: .rounded))
                    .opacity(0.6)
                Spacer()
            }
            .padding(.top, 8)
            .padding(.horizontal, 10)
//            .padding(.bottom, 30)
        }
        .frame(height: 100)
    }
}

struct SmallTitle_Previews: PreviewProvider {
    static var previews: some View {
        SmallTitle()
    }
}
