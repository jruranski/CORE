//
//  AddPlaceView.swift
//  CORE
//
//  Created by Jakub Ruranski on 16/08/2020.
//

import SwiftUI

struct AddPlaceView: View {
    
    @Binding var showAdd: Bool
    
    
    var body: some View {
        VStack {
            VStack {
                HStack(spacing: 5) {
                    Button(action: {showAdd.toggle()}) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 26, weight: .medium, design: .rounded))
                    }.foregroundColor(Color(.label))
                    
                    Text("Add new location")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                    Spacer()
                }
                .padding(.horizontal, 10)
                .padding(.leading , 14)
                .padding(.top, 30)
            }
            Spacer()
        }
}
}
struct AddPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlaceView(showAdd: .constant(false))
    }
}
