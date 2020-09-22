//
//  MuscleModel.swift
//  CORE
//
//  Created by Jakub Ruranski on 27/08/2020.
//

import SwiftUI


struct Muscle {
    var id = UUID()
    var name: String
    var selected: Bool
    var image: String
    
    init(name: String) {
        self.name = name
        self.selected = false
        self.image = "\(name.trimmingCharacters(in: .whitespaces))ModelImage"
    }
    
}

class MuscleModel: ObservableObject {
    @Published var muscles: [Muscle] = [
        
        Muscle(name: "Chest"),
        Muscle(name: "Shoulders"),
        Muscle(name: "Abs"),
        Muscle(name: "Biceps"),
        Muscle(name: "Triceps"),
        Muscle(name: "Back"),
        Muscle(name: "Forearms"),
        Muscle(name: "Deltoids"),
        Muscle(name: "Neck"),
        Muscle(name: "Lower Back"),
        Muscle(name: "Quadriceps"),
        Muscle(name: "Hamstrings"),
        Muscle(name: "Glutes"),
        Muscle(name: "Abductors"),
        Muscle(name: "Calves"),
        Muscle(name: "Adductors"),
        Muscle(name: "Core")
        
        
   
    ]
    
    func setSelected(index: Int) {
        let state = muscles[index].selected
        print(state)
        muscles[index].selected = !state
    }
}

class WeekdaysModel: ObservableObject {
    @Published var weekdays: [WeekdaySection] = []
    
    var weekdaysStrings = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    func getSections() -> [WeekdaySection] {
        var weekdays: [WeekdaySection] = []
//        var formattedString: String?
        
        let date = Date()
//        let formatter = DateFormatter()
        let startDate = date.dayOfWeek() ?? "Monday"
        let index = weekdaysStrings.firstIndex(of: startDate)
        var inx = 0
        
        for i in weekdaysStrings.indices {
            if i < index! {
                weekdays.append(WeekdaySection(id: weekdaysStrings.count - inx, name: weekdaysStrings[i], workouts: []))
            }else if i == index {
                weekdays.insert(WeekdaySection(id: 0, name: startDate, workouts: []), at: 0)
                inx += 1
            }else if i > index! {
                weekdays.insert(WeekdaySection(id: inx, name: weekdaysStrings[i], workouts: []), at: inx)
                inx += 1
            }
            
        }
        return weekdays
    }
}
