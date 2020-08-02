//
//  EquipmentView.swift
//  CORE
//
//  Created by Jakub Ruranski on 27/07/2020.
//

import SwiftUI

struct EquipmentView: View {
    
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                HStack(spacing: 5) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 26, weight: .medium, design: .rounded))
                    Text("Equipment")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                    Spacer()
                }
                .padding(.horizontal, 10)
                .padding(.leading , 14)
                .padding(.top, 30)
                
                HStack {
                    Text("Bars")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .opacity(0.5)
                        .padding(.leading, 24)
                    Spacer()
                }
                LazyVGrid(columns: columns, alignment: .center) /*@START_MENU_TOKEN@*/{
                    
                    EquipmentCard()
                    EquipmentCard()
                    EquipmentCard()
                    
                }/*@END_MENU_TOKEN@*/
                
                Spacer()
            }
        }
    }
}

struct EquipmentView_Previews: PreviewProvider {
    static var previews: some View {
        EquipmentView()
    }
}
