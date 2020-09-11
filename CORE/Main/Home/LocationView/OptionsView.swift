//
//  OptionsView.swift
//  CORE
//
//  Created by Jakub Ruranski on 11/09/2020.
//

import SwiftUI

struct OptionsView: View {
    
    var options = ["Full Gym", "Basic Home Equipment","Select myself", "No Equipment"]
    @Binding var showOptions: Bool
    @Binding var eqString: String
    @Binding var showEq: Bool
    
    func selectEquipment(index: Int) {
        switch index {
        case 0:
            eqString = "Ab Wheel;Abdominal Bench;Abdominal Crunch Machine;Abduction Machine;Adjustable Bench;Aerobic Step;AirBike;Back Extension Bench;Back Extension Machine;Balance Trainer;Barbell;Battle Ropes;Bench Press Machine;Biceps Curl Bench;Biceps Curl Machine;Cable Crossover Machine;Cable Row Machine;Calf Raise Machine;Chest Press Machine;Decline Bench;Dip Bar;Dumbbells;Elliptical;Exercise Ball;Exercise Mat;Ez Curl Bar;Flat Bench;Foam Roller;Glute Ham Raise Bench;Glute Kickback Machine;Hyperextension Bench;Incline Bench;Indoor Cycle Bike;Jump Box;Jump Rope;Kettlebell;Lat Pulldown Machine;Leg Curl Machine;Leg Extension Machine;Leg Press Machine;Medicine Ball;Non-motorized Treadmill (Air runner);Olympic Weight Bench;Pec Deck Machine (fly);Plates;Power Tower;Pullup Bar;Recumbent Bike;Row Cable Machine;Rowing Machine;Shoulder Press Machine;Smith Machine;Spin Bike;Squat Rack;Stairmill;Suspension Trainer (TRX);Treadmill;Triceps Bar;Wall Ball"
            showOptions.toggle()
            showEq.toggle()
        case 1:
            eqString = "Dumbbells;Exercise Mat;"
            showOptions.toggle()
            showEq.toggle()
        case 2:
            eqString = ""
            showOptions.toggle()
            showEq.toggle()
        case 3:
            eqString = ""
            showOptions.toggle()
            
        default:
            break
        }
        
    }
    var body: some View {
        VStack {
            
            VStack {
                Rectangle()
                    .frame(width: 40, height: 5)
                    .cornerRadius(3)
                    .opacity(0.1)
                
                VStack {
                    Text("Choose your equipment")
                        .font(.system(size: 28, weight: .bold,design: .rounded))
                    
                    
                    ForEach(options.indices, id: \.self) {option in
                        Button(action: {selectEquipment(index: option)}) {
                            VStack {
                                Text(options[option])
                                    .font(.system(size: 20, weight: .bold,design: .rounded))
                            }
                            .frame(width: 300, height: 60, alignment: .center)
                            .background(Color(.systemBackground))
                            .cornerRadius(30)
                            .modifier(ShadowModifier())
                            .padding()
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
            }
            
        Spacer()
        }
        .padding()
//        .edgesIgnoringSafeArea(.all)
        .frame(maxWidth: .infinity)
        
        .background(
            BlurView(style: .systemMaterial))
        .cornerRadius(30, corners: [.topLeft, .topRight])
        .padding(.bottom, 50)
        .modifier(ShadowModifier())
    }
}

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView(showOptions: .constant(false), eqString: .constant(""), showEq: .constant(false))
    }
}
