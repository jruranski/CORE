//
//  EquipmentDataModel.swift
//  CORE
//
//  Created by Jakub Ruranski on 16/08/2020.
//

import Foundation


class EquipmentModel: ObservableObject {
    @Published var equipment: [Equipment] = []
    @Published var available: String = ""
    @Published var sections: [EquipmentSection] = []
    
    init(available: String) {
        self.available = available
        equipment = loadEquipment()
        sections = createSections()
    }
    
    
    
    func loadEquipment() -> [Equipment] {
        var eq: [Equipment] = []
        
        
        
        
        let allEqString = "Ab Wheel;Other equipment;Abdominal Bench;Benches;Abdominal Crunch Machine;Weight machines;Abduction Machine;Weight machines;Adjustable Bench;Benches;Aerobic Step;Other equipment;AirBike;Cardio ;Back Extension Bench;Benches;Back Extension Machine;Weight machines;Balance Trainer ;Other equipment;Barbell;Bars;Battle Ropes;Other equipment;Bench Press Machine;Weight machines;Biceps Curl Bench;Benches;Biceps Curl Machine;Weight machines;Cable Crossover Machine;Cable machines ;Cable Row Machine;Cable machines ;Calf Raise Machine;Weight machines;Chest Press Machine;Weight machines;Decline Bench;Benches;Dip Bar;Rigs & Racks;Dumbbells;Free weights;Elliptical;Cardio ;Exercise Ball;Other equipment;Exercise Mat;Other equipment;Ez Curl Bar ;Bars;Flat Bench;Benches;Foam Roller;Other equipment;Glute Ham Raise Bench ;Benches;Glute Kickback Machine;Weight machines;Hyperextension Bench;Benches;Incline Bench;Benches;Indoor Cycle Bike;Cardio ;Jump Box;Other equipment;Jump Rope;Other equipment;Kettlebell;Free weights;Lat Pulldown Machine;Cable machines ;Leg Curl Machine;Weight machines;Leg Extension Machine;Weight machines;Leg Press Machine;Weight machines;Medicine Ball;Other equipment;Non-motorized Treadmill (Air runner);Cardio ;Olympic Weight Bench;Benches;Pec Deck Machine (fly);Weight machines;Plates;Free weights;Power Tower;Rigs & Racks;Pullup Bar ;Rigs & Racks;Recumbent Bike;Cardio ;Rowing Machine;Cardio ;Shoulder Press Machine;Weight machines;Smith Machine;Rigs & Racks;Spin Bike;Cardio ;Squat Rack;Rigs & Racks;Stairmill;Cardio ;Suspension Trainer (TRX);Other equipment;Treadmill;Cardio ;Triceps Bar;Bars;Wall Ball;Other equipment"
        
        let allEqArray = allEqString.components(separatedBy: ";")
        
        for i in allEqArray.indices {
            if i % 2 == 0 {
                let item = Equipment(name: allEqArray[i].trimmingCharacters(in: .whitespaces), category: allEqArray[i + 1].trimmingCharacters(in: .whitespaces))
                eq.append(item)
            }
        }
        
        let availableArray = available.components(separatedBy: ";")
        
        for i in availableArray {
            for j in eq.indices {
                if i == eq[j].name {
                    eq[j].isPresent = true
                }
            }
        }
        
        print(eq)
        return eq
    }
    
    func createSections() -> [EquipmentSection] {
        var eqSections: [EquipmentSection] = []
        
        eqSections.append(EquipmentSection(name: "Benches", equipment: []))
        eqSections.append(EquipmentSection(name: "Bars", equipment: []))
        eqSections.append(EquipmentSection(name: "Free weights", equipment: []))
        eqSections.append(EquipmentSection(name: "Weight machines", equipment: []))
        eqSections.append(EquipmentSection(name: "Cable machines", equipment: []))
        eqSections.append(EquipmentSection(name: "Rigs & Racks", equipment: []))
        eqSections.append(EquipmentSection(name: "Cardio", equipment: []))
        eqSections.append(EquipmentSection(name: "Other equipment", equipment: []))
        
        for i in equipment {
            switch i.category {
            
            case "Benches":
                eqSections[0].equipment.append(i)
                
            case "Bars":
                eqSections[1].equipment.append(i)
            case "Free weights":
                eqSections[2].equipment.append(i)
            case "Weight machines":
                eqSections[3].equipment.append(i)
            case "Cable machines":
                eqSections[4].equipment.append(i)
            case "Rigs & Racks":
                eqSections[5].equipment.append(i)
            case "Cardio":
                eqSections[6].equipment.append(i)
                
            default:
                eqSections[7].equipment.append(i)
            }
        }
        
        
        
        return eqSections
    }
    
    func getSelectionString() -> String {
        var string = ""
        
        for i in equipment {
            if i.isPresent {
                let eqString = i.name.trimmingCharacters(in: .whitespaces)
                string = "\(string);\(eqString)"
            }
        }
        
        
        return string
    }
    
    
}





struct Equipment {
    var name: String
    var category: String
    var image: String
    var isPresent: Bool
    
    
    init(name: String, category: String, isPresent: Bool) {
        self.name = name
        self.isPresent = isPresent
        self.image = "\(name.replacingOccurrences(of: " ", with: ""))"
        // change to if name matches category add category
        self.category = category
    }
    
    init(name: String, category: String) {
        self.name = name
        self.isPresent = false
        self.image = "\(name)"
        // change to if name matches category add category
        self.category = category
    }
}

func appendEquipment() -> [Equipment] {
    let equipment: [Equipment] = [
    
        Equipment(name: "Ez-Bar", category: "Bars")
        
    ]
    
    
    return equipment
}


func appendSections() -> [EquipmentSection] {
    let sections: [EquipmentSection] = [
    
    EquipmentSection(name: "Bars", equipment: [])
    
    ]
    
    return sections
}

struct EquipmentSection {
    var name: String
    var equipment: [Equipment]
    
}
