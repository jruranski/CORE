//
//  PastWorkoutDetail.swift
//  CORE
//
//  Created by Jakub Ruranski on 29/07/2020.
//

import SwiftUI

struct PastWorkoutDetail: View {
    var body: some View {
        ScrollView {
            VStack {
//                HStack {
//                    Image(systemName: "chevron.left")
//                        .font(.system(size: 26, weight: .semibold, design: .rounded))
//                    Spacer()
//                }
//                .padding(.leading, 20)
//                .padding(.bottom, 20)
                HStack {
                    VStack(alignment: .leading) {
                        Text("08/07/2020 - 13:14")
                            .font(.system(size: 14, weight: .regular, design: .rounded))
                            .opacity(0.5)
//                        Text("Full body workout")
//                            .font(.system(size: 30, weight: .bold, design: .rounded))
                    }
                    Spacer()
                    
                }
                .padding(.leading, 16)
                
                
                PastWorkoutSummaryCard()
                
                HStack {
                    Text("Sets")
                        .font(.system(size: 26, weight: .bold, design: .rounded))
                    Spacer()
                }
                .padding(.leading, 16)
                
                List {
                    Text("Bench Press")
                }
                
                
                HStack {
                    Text("My Effort")
                        .font(.system(size: 26, weight: .bold, design: .rounded))
                    Spacer()
                    Image(systemName: "plus")
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                }.padding(.horizontal, 16)
                .padding(.vertical)
                
                HStack {
                    Text("My Effort")
                        .font(.system(size: 26, weight: .bold, design: .rounded))
                    Spacer()
                    Image(systemName: "plus")
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                }.padding(.horizontal, 16).padding(.vertical)
                Spacer()
            }
            .navigationBarTitle(Text("Full body workout"), displayMode: .large)
        }
    }
}

struct PastWorkoutDetail_Previews: PreviewProvider {
    static var previews: some View {
        PastWorkoutDetail()
    }
}
