//
//  MyPlacesView.swift
//  CORE
//
//  Created by Jakub Ruranski on 26/07/2020.
//

import SwiftUI




struct MyPlacesView: View {
    
    
    @State var showEquipment: Bool = false
    
    var body: some View {
        ZStack {
        NavigationView {
            List {
                MyPlacesBigCard(showEquipment: $showEquipment)
                
                    
                MyPlacesBigCard(showEquipment: $showEquipment)
                        
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
                .background(Color.white) //change 4 dm
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .modifier(ShadowModifier())
                
                
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
            .onAppear {
                UITableView.appearance().separatorStyle = .none
            }
            
        }
        
        if showEquipment {
            EquipmentView(show: $showEquipment)
                .animation(.easeInOut)
                .transition(.move(edge: .trailing))
        }
        }
    }
}

struct MyPlacesView_Previews: PreviewProvider {
    static var previews: some View {
        MyPlacesView()
    }
}
