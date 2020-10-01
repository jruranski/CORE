//
//  ActivitySeparator.swift
//  CORE
//
//  Created by Jakub Ruranski on 27/07/2020.
//

import SwiftUI

struct ActivitySeparator: View {
    var body: some View {
        HStack {
            Text("My Workouts")
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .opacity(0.5)
            Spacer()
        }
        .padding(.leading, 20)
        .frame(width: screenWidth, height: 35, alignment: .center) //change
        .background(Color(.systemBackground))
        .cornerRadius(20, corners: [.topLeft, .topRight])
        .shadow(color: Color(.label).opacity(0.15), radius: 10, y: -14)
    }
}

struct ActivitySeparator_Previews: PreviewProvider {
    static var previews: some View {
        ActivitySeparator()
    }
}
