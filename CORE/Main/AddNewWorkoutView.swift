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
    
    var body: some View {
        ZStack {
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
                
                VStack {
                    Button(action: {showDetail.toggle()}) {
                    BigWorkoutCard()
                        
                    }.buttonStyle(PlainButtonStyle())
        //                .navigationBarTitle(Text(Add a new workout))
                }.padding(.top)
                Spacer()
            }.background(Color(.systemBackground))
        .opacity(showDetail ? 0 : 1)
            .animation(.easeInOut)
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
