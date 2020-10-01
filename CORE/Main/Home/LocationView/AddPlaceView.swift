//
//  AddPlaceView.swift
//  CORE
//
//  Created by Jakub Ruranski on 16/08/2020.
//

import SwiftUI
import MapKit
import CoreData

struct AddPlaceView: View {
    
    @Environment(\.managedObjectContext) private var moc
    
    @Binding var showAdd: Bool
    @State var showEq: Bool = false
    @State var titleString: String = ""
    @State var location = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 56.951924, longitude: 24.125584), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
    @State var equipmentString: String = "Barbell;Dumbbell"
    @State var showOptions: Bool = false
    @State var bottomState = CGSize.zero
    @State var subtitleString = "No Equipment"
    var opacity = 0.8
    
    
    func save() {
        let newLocation = Location(context: moc)
        newLocation.name = titleString
        newLocation.equipment = equipmentString
        newLocation.latitude = location.center.latitude
        newLocation.longtitude = location.center.longitude
        newLocation.subtitle = subtitleString
        
        do {
            try self.moc.save()
        }catch{
            let erro = error.localizedDescription
            print(erro)
        }
        self.showAdd.toggle()
    }
    
    
    var body: some View {
        ZStack {
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
                        .frame(width: screenWidth - 20, height: 50, alignment: .center)
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
                            .frame(width: screenWidth - 20, height: 150, alignment: .center)
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
                        
                        Button(action: {showOptions.toggle()}) {
                            VStack {
                                Text("Select Equipment")
                                    .font(.system(size: 18, weight: .bold, design: .rounded))
                            }.padding()
                            .frame(width: screenWidth - 20, height: 100, alignment: .center)
                            .background(Color(.systemBackground))
                            .cornerRadius(20)
                            .modifier(ShadowModifier())
                        }.buttonStyle(PlainButtonStyle())
                        
                        
                    }
                    
                    Spacer()
                    VStack {
                        HStack {
                            Button(action: {save()}) {
                                Text("Save")
                                    .font(.system(size: 24, weight: .bold, design: .rounded))
                                    .foregroundColor(.white)
                            }.padding()
                        }.frame(width: screenWidth - 20, height: 60, alignment: .center)
                        .background(Color.red)
                        .cornerRadius(20)
                        .padding()
                    }.shadow(color: Color(.systemRed).opacity(0.15), radius: 10, x: 0.0, y: 10)
                    
                    
                   
                }
            }
            
            
            OptionsView(showOptions: $showOptions, eqString: $equipmentString, showEq: $showEq, subtitle: $subtitleString)
                    .offset(y: showOptions ? 200 : 1000)
                    .offset(y: self.bottomState.height)
                    .transition(.move(edge: .bottom))
                    .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
                    .gesture(
                    DragGesture()
                        .onChanged {value in
//                            self.bottomState = value.translation
//                            if self.showOptions {
//                                self.bottomState.height += -300
//                            }
                            
                            self.bottomState = value.translation
                            if bottomState.height < -100 {
                            self.bottomState = .zero
                            }
                            
                        }
                        .onEnded {value in
                            if bottomState.height < -100 {
                            self.bottomState = .zero
                            }
                            
                            if bottomState.height > 50 {
                                self.bottomState = .zero
                                self.showOptions = false
                            }
//                            if (self.bottomState.height < -100 && !self.showOptions) || (self.bottomState.height < -250 && self.showOptions) {
//                                self.bottomState.height = -300
//                                self.showOptions = true
//                            }else{
//                                self.bottomState = .zero
//                                self.showOptions = false
//                            }
//
//                            if self.bottomState.height < -300 {
//                                self.bottomState = .zero
//                            }
                        }
                    )
            
            
            
            if showEq {
                EquipmentView(show: $showEq, equipmentString: $equipmentString).environmentObject(EquipmentModel(available: equipmentString))
                    .transition(.move(edge: .trailing))
                    .animation(.easeInOut)
            }
            
            
        }
}
}
struct AddPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlaceView(showAdd: .constant(false))
    }
}
