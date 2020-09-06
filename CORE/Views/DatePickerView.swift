//
//  DatePickerView.swift
//  CORE
//
//  Created by Jakub Ruranski on 27/08/2020.
//

import SwiftUI

struct DatePickerView: View {
    
    
    @Binding var changingDate: Date
    @Binding var show: Bool
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    HStack {
                        Text("Select the date")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                    }
                    DatePicker("Input your date", selection: $changingDate)
                        .datePickerStyle(GraphicalDatePickerStyle())
                        
                        .frame(maxWidth: 350, maxHeight: 400)
                    Button(action: {show.toggle() }) {
                        HStack {
                            Text("Done")
                                .font(.system(size: 18, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        }.frame(width: 200, height: 40)
                        .background(Color(.systemBlue))
                        .cornerRadius(20)
                        
                        
                        
                    }.buttonStyle(PlainButtonStyle())
                    Spacer()
                }.padding()
            }.frame(width: 350, height: 500)
            .background(Color(.systemBackground))
            .cornerRadius(30)
            .modifier(ShadowModifier())
        }.frame(width: 375, height: 1300)
        .background(BlurView(style: .systemMaterial))
        
    }
    
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView(changingDate: .constant(Date()), show: .constant(true))
            
    }
}
