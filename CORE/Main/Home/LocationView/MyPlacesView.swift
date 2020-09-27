//
//  MyPlacesView.swift
//  CORE
//
//  Created by Jakub Ruranski on 26/07/2020.
//

import SwiftUI
import CoreData



struct MyPlacesView: View {
    
    @Environment(\.managedObjectContext) private var managedObjectContext
    
    @FetchRequest(entity: Location.entity(), sortDescriptors: []) private var locations: FetchedResults<Location>

    @State var showAdd: Bool = false
    @State var showEquipment: Bool = false
    @State var travelShow: Bool = true
    @State var showDetail:Bool = false
    @State var pickedLocation: Location?
    @Binding var showLocations: Bool
    var location: Location?
    
    
    func firstLaunch() {
        if locations.count == 0 {
            let travelLocation = Location(context: managedObjectContext)
            travelLocation.name = "Travel"
            travelLocation.equipment = ""
            travelLocation.subtitle = ""
            do {
                try self.managedObjectContext.save()
            }catch{
                let err = error.localizedDescription
                print(err)
            }
        }else{
            var hasTravel = false
            for i in locations {
                if i.name == "Travel" {
                    hasTravel = true
                    
                }
            }
            if hasTravel == false {
                let travelLocation = Location(context: managedObjectContext)
                travelLocation.name = "Travel"
                travelLocation.equipment = ""
                travelLocation.subtitle = ""
                do {
                    try self.managedObjectContext.save()
                }catch{
                    let err = error.localizedDescription
                    print(err)
                }
            }
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    HStack {
                        HStack(spacing: 2) {
                            Button(action: { showLocations.toggle()}) {
                                Image(systemName: "chevron.left")
                                    .font(.system(size: 26, weight: .bold, design: .rounded))
                            }.buttonStyle(PlainButtonStyle())
                                Text("My Locations")
                //                    .padding()
                                    .font(.system(size: 30, weight: .bold, design: .rounded))
                                Spacer()
                                
                        }
                        Button(action: { showAdd.toggle()}) {
                            Image(systemName: "plus")
                                .renderingMode(.original)
                                .font(.system(size: 18, weight: .bold, design: .rounded))
                //                .aspectRatio(contentMode: .fit)
                                .padding(.all,  2)
                                .frame(width: 36, height: 36, alignment: .center)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
                                .shadow(color: Color.black.opacity(0.1), radius: 10, y: 6)
                                .shadow(color: Color.black.opacity(0.15), radius: 1, y: 1)
                        }.buttonStyle(PlainButtonStyle())
                    }
                    }
                    .padding(.horizontal, 10)
                    .padding(.leading , 8)
                .padding(.top, 30)
            List {
                ForEach(locations, id: \.id) { location in
                    if location.name == "Travel" {
                     TravelBigCard()
                    }else{
                        Button(action: {
                            pickedLocation = location
                            showDetail.toggle()
                           
                        }) {
                    MyPlacesBigCard(show: $showEquipment, location: location)
                        .padding(.bottom)
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
                
            }
            .listStyle(SidebarListStyle())
            .onAppear {
                UITableView.appearance().separatorStyle = .none
            }
            
        }
            .background(Color(.systemBackground))
            
            .opacity(showEquipment ? 0 : 1)
            .opacity(showAdd ? 0 : 1)
            .animation(.linear)
        
        if showEquipment {
            EquipmentView(show: $showEquipment, equipmentString: .constant("")).environmentObject(EquipmentModel(available: ""))
                .animation(.easeInOut(duration: 0.2))
                .transition(.move(edge: .trailing))
        }
            if showAdd {
                AddPlaceView(showAdd: $showAdd).environment(\.managedObjectContext, managedObjectContext)
                    .animation(.spring())
                    .transition(.move(edge: .trailing))
            }
            if showDetail {
                LocationDetailView(location: pickedLocation!, showAdd: $showDetail).environment(\.managedObjectContext, managedObjectContext)
                                    .animation(.spring())
                                    .transition(.move(edge: .trailing))
            }
        }.onAppear {
            firstLaunch()
        }
    }
}

struct MyPlacesView_Previews: PreviewProvider {
    static var previews: some View {
        MyPlacesView(showLocations: .constant(false)).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

struct TravelBigCard: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Travel")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                    Text("No Equipment")
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                }
                .padding(.leading, 16)
                Spacer()
            }
            
            
        }
        .frame(width: 330, height: 100, alignment: .center)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .modifier(ShadowModifier())
        .padding(.bottom)
        
        .navigationBarTitle(Text("My Places"))
        .navigationBarItems(leading: EditButton())
        .navigationBarItems(trailing:
                                
                                Button(action: {}) {
                                    Image(systemName: "plus")
                                        .renderingMode(.original)
                                        .font(.system(size: 18, weight: .bold, design: .rounded))
                                        //                .aspectRatio(contentMode: .fit)
                                        .padding(.all,  2)
                                        .frame(width: 36, height: 36, alignment: .center)
                                        .background(Color.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
                                        .modifier(ShadowModifier())
                                }
                            
        )
    }
}
