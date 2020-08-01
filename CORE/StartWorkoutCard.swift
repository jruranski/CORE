//
//  StartWorkoutCard.swift
//  CORE
//
//  Created by Jakub Ruranski on 21/07/2020.
//

import SwiftUI

struct StartWorkoutCard: View {
    var body: some View {
        HStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
        }
        .frame(width: 325, height: 175, alignment: .center)
        .padding(.all, 10)
        .background(Color.black) // change to image or smth
        .clipShape(RoundedRectangle(cornerRadius: 30.0, style: .continuous))
        .modifier(ShadowModifier())
    }
}

struct StartWorkoutCard_Previews: PreviewProvider {
    static var previews: some View {
        StartWorkoutCard()
    }
}
