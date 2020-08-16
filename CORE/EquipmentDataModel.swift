//
//  EquipmentDataModel.swift
//  CORE
//
//  Created by Jakub Ruranski on 16/08/2020.
//

import Foundation

struct Equipment {
    var name: String
    var category: String
    var image: String
    var isPresent: Bool
    
    
    init(name: String, category: String, isPresent: Bool) {
        self.name = name
        self.isPresent = isPresent
        self.image = "\(name)"
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


func appendSections() -> [Section] {
    let sections: [Section] = [
    
    Section(name: "Bars", equipment: [])
    
    ]
    
    return sections
}
