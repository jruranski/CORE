//
//  LocationDetailView.swift
//  CORE
//
//  Created by Jakub Ruranski on 26/09/2020.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    @Environment(\.managedObjectContext) private var moc
//    @FetchRequest(entity: Location.entity(), sortDescriptors: []) var locations: FetchedResults<Location>
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var showAdd: Bool
    @State var showEq: Bool = false
    @State var titleString: String = ""
    @State var location = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 56.951924, longitude: 24.125584), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
    @State var equipmentString: String = "Barbell;Dumbbell"
    @State var showOptions: Bool = false
    @State var bottomState = CGSize.zero
    @State var subtitleString = "No Equipment"
    @State var eqTextFieldString = "Change Equipment"
    @State var showDeleteAlert: Bool = false
    
    var opacity = 0.8
    var newLocation: Location?
    func delete() {
        
        
        if let loc = newLocation {
            
        moc.delete(loc)
        do {
            try self.moc.save()
        }catch{
            let err = error.localizedDescription
            
            print(err)
        }
        }
        self.showAdd.toggle()
    }
    func save() {
        if let newLocation = newLocation {
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
        }
        self.showAdd.toggle()
    }
    
    init(location: Location, showAdd: Binding<Bool>) {
        self._showAdd = showAdd
        self.newLocation = location
        self._titleString = State(initialValue: location.name ?? "Gym")
        self._equipmentString = State(initialValue: location.equipment ?? "")
        self._subtitleString = State(initialValue: location.subtitle ?? "No Equipment")
        self._location = State(initialValue: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: location.latitude , longitude: location.longtitude ), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)))
       
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
                            
                            Text("Edit Location")
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
                        .background(Color(.tertiarySystemGroupedBackground))
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
                        
                        Button(action: {showOptions.toggle()}) {
                            VStack {
                                Text(eqTextFieldString)
                                    .font(.system(size: 18, weight: .bold, design: .rounded))
                            }.padding()
                            .frame(width: 350, height: 100, alignment: .center)
                            .background(Color(colorScheme == .light ? .systemBackground : .tertiarySystemGroupedBackground))
                            .cornerRadius(20)
                            .modifier(ShadowModifier())
                        }.buttonStyle(PlainButtonStyle())
                        
                        
                    }
                    
                    Spacer()
                    HStack {
                        
                        VStack {
                            HStack {
                                Button(action: {showDeleteAlert.toggle()}) {
                                    Image(systemName: "trash.fill")
                                        .font(.system(size: 24, weight: .bold, design: .rounded))
                                        .foregroundColor(.white)
                                }.padding()
                            }.frame(width: 60, height: 60, alignment: .center)
                            .background(Color(.systemRed))
                            .cornerRadius(20)
                            .padding()
                        }.shadow(color: Color(.systemRed).opacity(0.15), radius: 10, x: 0.0, y: 10)
                        .padding(.trailing, -20)
                        
                        VStack {
                            HStack {
                                Button(action: {save()}) {
                                    Text("Save")
                                        .font(.system(size: 24, weight: .bold, design: .rounded))
                                        .foregroundColor(.white)
                                }.padding()
                            }.frame(width: 280, height: 60, alignment: .center)
                            .background(Color(.systemGreen))
                            .cornerRadius(20)
                            .padding()
                        }.shadow(color: Color(.systemRed).opacity(0.15), radius: 10, x: 0.0, y: 10)
                        .padding(.leading, -8)
                    }
                    
                    
                   
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
        .background(Color(.systemBackground).edgesIgnoringSafeArea(.all))
        .alert(isPresented: $showDeleteAlert, content: {
            Alert(title: Text("Delete a location"), message: Text("Are you sure you want to delete this location?"), primaryButton: .destructive(Text("Delete"), action: {delete()}), secondaryButton: .cancel())
        })
}
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(location: Location(context: PersistenceController.preview.container.viewContext), showAdd: .constant(true))
            .environment(\.colorScheme, .dark)
//            .environment(\.colorScheme, .d)
    }
}
