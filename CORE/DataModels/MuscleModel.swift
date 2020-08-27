//
//  MuscleModel.swift
//  CORE
//
//  Created by Jakub Ruranski on 27/08/2020.
//

import SwiftUI


struct Muscle {
    var id: Int
    var name: String
    var selected: Bool
    var image: String
}

class MuscleModel: ObservableObject {
    @Published var muscles: [Muscle] = [Muscle(id: 0, name: "Chest", selected: false, image: "chestModelImage")]
}


