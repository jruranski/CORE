//
//  AddPlaceView.swift
//  CORE
//
//  Created by Jakub Ruranski on 16/08/2020.
//

import SwiftUI
import MapKit

struct AddPlaceView: View {
    
    @Binding var showAdd: Bool
    @State var titleString: String = ""
    @State var location = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 56.951924, longitude: 24.125584), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
    var opacity = 0.8
    
    
    func save() {
        
    }
    
    
    var body: some View {
        ScrollView {
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
                
                
                VStack {
                    HStack {
                        Text("Title:")
                            .font(.system(size: 16, weight: .medium, design: .rounded))
                            .opacity(opacity)
                        Spacer()
                    }.padding(.horizontal)
                    
                    HStack(alignment: .center) {
                        TextField("Gym", text: $titleString)
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .frame(alignment: .center)
                        
                    }
                    
                    .padding()
                    .frame(width: 350, height: 50, alignment: .center)
                    .background(Color(.systemGroupedBackground))
                    .cornerRadius(10)
                }.padding(.top)
                
                VStack {
                    HStack {
                        Text("Location:")
                            .font(.system(size: 16, weight: .medium, design: .rounded))
                            .opacity(opacity)
                        Spacer()
                    }.padding(.horizontal)
                    
                    MapView(location: $location) //mapview
                        .frame(width: 350, height: 150, alignment: .center)
                        .cornerRadius(20)
                        .modifier(ShadowModifier())
                }
                
                
                VStack {
                    HStack {
                        Text("Equipment:")
                            .font(.system(size: 16, weight: .medium, design: .rounded))
                            .opacity(opacity)
                        Spacer()
                    }.padding(.horizontal)
                    
                    VStack {
                        Text("Select Equipment")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                    }.padding()
                    .frame(width: 350, height: 100, alignment: .center)
                    .background(Color(.systemBackground))
                    .cornerRadius(20)
                    .modifier(ShadowModifier())
                    
                    
                }
                
                Spacer()
                VStack {
                    HStack {
                        Button(action: {save()}) {
                            Text("Save")
                                .font(.system(size: 24, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        }.padding()
                    }.frame(width: 350, height: 60, alignment: .center)
                    .background(Color.red)
                    .cornerRadius(20)
                    .padding()
                }.shadow(color: Color(.systemRed).opacity(0.15), radius: 10, x: 0.0, y: 10)
                
                
               
            }
        }
}
}
struct AddPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlaceView(showAdd: .constant(false))
    }
}
