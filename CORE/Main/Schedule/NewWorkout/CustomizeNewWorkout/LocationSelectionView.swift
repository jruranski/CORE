//
//  LocationSelectionView.swift
//  CORE
//
//  Created by Jakub Ruranski on 01/09/2020.
//

import SwiftUI

struct LocationSelectionView: View {
    
     var locations: [String] = ["Gym", "Home", "Fabryka Formy", "Travel"]
    @State var selectedLocation: String = "Gym"
    @Binding var show: Bool
    
    
    
    
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Text("Select the location for your workout")
                        .font(.system(size: 26, weight: .bold, design: .rounded))
                        .padding(.vertical)
                        .padding(.horizontal, 5)
                    Picker("", selection: $selectedLocation) {
                        ForEach(locations, id: \.self) { location in
                            HStack {
                               Text(location)
                                .font(.headline)
                                .padding()
                            }
                        }
                        
                        
                        
                    }.pickerStyle(WheelPickerStyle())
                    .labelsHidden()
                    
                    Button(action: {show.toggle()}) {
                        VStack {
                            Text("Save")
                                .font(.system(size: 24, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        }.frame(width: 250, height: 50, alignment: .center)
                        .background(Color(.systemRed))
                        .cornerRadius(25)
                        .shadow(color: Color.red.opacity(0.3), radius: 10, x: 0.0, y: 5)
                        
                    }.padding()
                    
                    
                }.padding(5)
            }.frame(width: 360)
            .background(Color(.systemBackground))
            .cornerRadius(30)
            .modifier(ShadowModifier())
        }.frame(width: 375, height: 1300, alignment: .center)
        .background(BlurView(style: .systemMaterial))
        .animation(.spring(response: 0.6, dampingFraction: 0.4, blendDuration: 0))
    }
}

struct LocationSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSelectionView(show: .constant(false))
    }
}
