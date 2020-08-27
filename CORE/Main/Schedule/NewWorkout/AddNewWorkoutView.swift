//
//  AddNewWorkoutView.swift
//  CORE
//
//  Created by Jakub Ruranski on 25/07/2020.
//

import SwiftUI

struct AddNewWorkoutView: View {
    
    @Binding var showAdd: Bool
    @State var showDetail: Bool = false
    
    var cards: [AddNewCard] = [
        AddNewCard(title: "AI Workout", subtitle: "The app will create a workout customized just for you!", image: "aiRobotCard", logo: Image(systemName: "rectangle.stack.badge.person.crop"), startingColor: #colorLiteral(red: 0.8269839287, green: 0.1021612361, blue: 0.4810593128, alpha: 1), endColor: #colorLiteral(red: 1, green: 0.1502068937, blue: 0.3223169446, alpha: 1)),
        AddNewCard(title: "Custom Workout", subtitle: "You are the master! Create the perfect workout for you by yourself", image: "customBuiltCard", logo: Image(systemName: "gear"), startingColor: #colorLiteral(red: 0.06411776692, green: 0.2876800299, blue: 0.9169543982, alpha: 1), endColor: #colorLiteral(red: 0, green: 1, blue: 0.8973103166, alpha: 1)),
        AddNewCard(title: "Cardio Workout", subtitle: "Get your heart racing!", image: "CardioTreadmillCard", logo: Image(systemName: "bolt.heart"), startingColor: #colorLiteral(red: 0.8682882786, green: 0, blue: 0, alpha: 1), endColor: #colorLiteral(red: 1, green: 0.3828276694, blue: 0, alpha: 1))
    ]
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    HStack(spacing: 5) {
                        Button(action: {showAdd.toggle()}) {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 26, weight: .medium, design: .rounded))
                        }.foregroundColor(Color(.label))
                        
                        Text("Add New Workout")
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                        Spacer()
                    }
                    .padding(.horizontal, 10)
                    .padding(.leading , 14)
                    .padding(.top, 30)
                    
                    ForEach(cards, id: \.title) { item in
                        VStack {
                            Button(action: {showDetail.toggle()}) {
                                BigWorkoutCard(title: item.title, subtitle: item.subtitle, image: item.image, logo: item.logo, startingColor: item.startingColor, endColor: item.endColor)
                                
                            }.buttonStyle(PlainButtonStyle())
                //                .navigationBarTitle(Text(Add a new workout))
                        }.padding(.top)
                    }
                    Spacer()
                }.background(Color(.systemBackground))
            .opacity(showDetail ? 0 : 1)
                .animation(.easeInOut)
            }
        }
        if showDetail {
            CustomizeWorkout(showDetail: $showDetail, showAdd: $showAdd)
                .animation(.easeInOut(duration: 0.2))
                .transition(.move(edge: .trailing))
        }
    }
}

struct AddNewWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewWorkoutView(showAdd: .constant(false), showDetail: false)
    }
}


struct AddNewCard {
    
    
    var title: String
    var subtitle: String
    var image: String
    var logo: Image
    var startingColor: UIColor
    var endColor: UIColor
}
