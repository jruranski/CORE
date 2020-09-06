//
//  GoalSelectionView.swift
//  CORE
//
//  Created by Jakub Ruranski on 27/08/2020.
//

import SwiftUI

struct GoalSelectionView: View {
    
    
   var goals: [String] = ["Calories Burned", "Time", "No goal"]
    @State private var goal: String = "Time"
    @Binding var calorieString: String
    @State var timeGoal: Date = Date()
    @Binding var endDate: Date
    @Binding var startDate: Date
    @Binding var showGoal: Bool
    
    var body: some View {
        ZStack {
            
            VStack {
                VStack {
                    Text("Please select your goal")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .multilineTextAlignment(.center)
                        Picker("Pick your goal", selection: $goal) {
                            ForEach(goals, id: \.self) { goal in
                                HStack {
                                    Text(goal)
                                        .font(.headline)
                                        .padding()
                                }
                            }
                        }.pickerStyle(WheelPickerStyle())
                        .labelsHidden()
                    
                    if goal == "Calories Burned" {
                        HStack(alignment: .center) {
                            TextField("600kcal", text: $calorieString) //change
                                .font(.system(size: 24, weight: .bold, design: .rounded))
                                .frame(alignment: .center)
                                .multilineTextAlignment(.center)
                                .keyboardType(.numberPad)
                        }.padding()
                        .frame(width: 320, height: 50, alignment: .center)
                        .background(Color(.systemGroupedBackground))
                        .cornerRadius(10)
                        .padding(.bottom)
                        .onAppear {
                            calorieString = "600kcal"
                        }
                        
                        
                    }else if goal == "Time" {
                        DatePicker("Pick the end date", selection: $endDate, displayedComponents: [.hourAndMinute])
//                            .datePickerStyle(WheelPickerStyle())
                            .font(.system(size: 16, weight: .medium, design: .rounded))
                            .padding()
                    }else{
                        
                    }
                    
                    Button(action: {showGoal.toggle()}) {
                        VStack {
                            Text("Save")
                                .font(.system(size: 24, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        }.frame(width: 250, height: 50, alignment: .center)
                        .background(Color(.systemRed))
                        .cornerRadius(25)
                        .shadow(color: Color.red.opacity(0.3), radius: 10, x: 0.0, y: 5)
                        
                    }
                    
                }.padding()
            }.frame(width: 350)
            .background(Color(.systemBackground))
            .cornerRadius(30)
            .modifier(ShadowModifier())
            
            
        }.frame(width: 375, height: 1300, alignment: .center)
        .background(BlurView(style: .systemMaterial))
        .animation(.spring(response: 0.6, dampingFraction: 0.4, blendDuration: 0))
    }
}

struct GoalSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        GoalSelectionView(calorieString: .constant(""), endDate: .constant(Date()), startDate: .constant(Date()), showGoal: .constant(true))
    }
}
