//
//  RestDayCard.swift
//  CORE
//
//  Created by Jakub Ruranski on 24/07/2020.
//

import SwiftUI

struct RestDayCard: View {
    var body: some View {
        VStack {
            Text("Rest Day")
                .font(.system(size: 28, weight: .bold, design: .rounded))
        }
        .frame(width: 350, height: 100, alignment: .center)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(radius: 15, y: 10)
    }
}

struct RestDayCard_Previews: PreviewProvider {
    static var previews: some View {
        RestDayCard()
    }
}