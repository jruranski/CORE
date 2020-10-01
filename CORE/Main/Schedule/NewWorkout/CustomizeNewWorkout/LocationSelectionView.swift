//
//  LocationSelectionView.swift
//  CORE
//
//  Created by Jakub Ruranski on 01/09/2020.
//

import SwiftUI

struct LocationSelectionView: View {
    
    @Environment(\.managedObjectContext) private var managedObjectContext
    
    @FetchRequest(entity: Location.entity(), sortDescriptors: []) private var locations: FetchedResults<Location>
    
//     var locations: [String] = ["Gym", "Home", "Fabryka Formy", "Travel"]
    @Binding var selectedLocation: Location?
    @Binding var show: Bool
    
    
    @State var selectedIndex = 0
    
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Text("Select the location for your workout")
                        .font(.system(size: 26, weight: .bold, design: .rounded))
                        .padding(.vertical)
                        .padding(.horizontal, 5)
                    Picker("", selection: $selectedIndex) {
                        ForEach(0..<locations.count, id: \.self) { index in
                            HStack {
                                Text(locations[index].name ?? "Gym").tag(index)
                                .font(.headline)
                                .padding()
                            }
                        }
                        
                        
                        
                    }.pickerStyle(WheelPickerStyle())
                    .labelsHidden()
                    
                    Button(action: {
                        selectedLocation = locations[selectedIndex]
                        show.toggle()
                        print(selectedLocation!)
                    }
                    ) {
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
            }.frame(width: screenWidth - 10)
            .background(Color(.systemBackground))
            .cornerRadius(30)
            .modifier(ShadowModifier())
        }.frame(width: screenWidth, height: 1300, alignment: .center)
        .background(BlurView(style: .systemMaterial))
        .animation(.spring(response: 0.6, dampingFraction: 0.4, blendDuration: 0))
    }
}

struct LocationSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSelectionView(selectedLocation: .constant(Location(context: PersistenceController.preview.container.viewContext)), show: .constant(false)).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
