//
//  EquipmentView.swift
//  CORE
//
//  Created by Jakub Ruranski on 27/07/2020.
//

import SwiftUI





struct EquipmentView: View {
    
    
    @EnvironmentObject private var model: EquipmentModel
    
    @Binding var show: Bool
    
    var equipmentString: String = ""
    var availableEquipment: [String] = []
    var equipment: [Equipment] = appendEquipment() // all items
    
    var sections: [EquipmentSection] = []
    
    
//    init(show: Binding<Bool>, location: Location) {
//        equipmentString = location.equipment ?? ""
//        self._show = show
//
//
//        // get items from string and then add to availableEquipment
//
//
//        for index in equipment.indices {
//        for i in availableEquipment {
//            if i == equipment[index].name {
//                equipment[index].isPresent = true
//            }
//        }
//        }
//
//        sections = getSections(eq: equipment)
//
//    }
    
    
    
    func getSections(eq: [Equipment]) -> [EquipmentSection] {
        
        var sections: [EquipmentSection] = appendSections()
        for section in sections.indices {
        for i in eq {
            if sections[section].name == i.category {
                sections[section].equipment.append(i)
            }
        }
        }
        
        return sections
    }
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                HStack(spacing: 5) {
                    Button(action: {show.toggle()}) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 26, weight: .medium, design: .rounded))
                    }.foregroundColor(Color(.label))
                    
                    Text("Equipment")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                    Spacer()
                }
                .padding(.horizontal, 10)
                .padding(.leading , 14)
                .padding(.top, 30)
                ForEach(model.sections, id: \.name) { section in
                HStack {
                    Text(section.name)
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .opacity(0.5)
                        .padding(.leading, 24)
                        .padding(.top)
                    Spacer()
                }
                LazyVGrid(columns: columns, alignment: .center) /*@START_MENU_TOKEN@*/{
                    ForEach(section.equipment, id: \.name) { equipment in
                        EquipmentCard(title: equipment.name, select: equipment.isPresent)
                            
                            
                    }
                    
                }/*@END_MENU_TOKEN@*/
                .padding(.horizontal)
                Spacer()
            }
            }
        }
        .background(Color(.systemBackground))
//        .animation(.easeInOut)
//        .transition(.move(edge: .leading))
//        .gesture(
//            DragGesture(minimumDistance: 20)
//                .onChanged { coordinate in
//
//                }
//        )
    }
}

struct EquipmentView_Previews: PreviewProvider {
    static var previews: some View {
        EquipmentView(show: .constant(true))
            .environmentObject(EquipmentModel(available: "Barbell;Dumbbells"))
    }
}
