//
//  ActivityView.swift
//  CORE
//
//  Created by Jakub Ruranski on 27/07/2020.
//

import SwiftUI

struct ActivityView: View {
    
    @State var press: Bool = false
    
    var body: some View {
        ZStack {
            NavigationView {
                ScrollView {
                    VStack(spacing: 30) {
                        ActivityCard()
                        VStack(spacing: 0) {
                        ActivitySeparator()
                            .padding(.bottom, 10)
                            .padding(.top, 10)
                            VStack(spacing: 20) {
                                NavigationLink(
                                    destination: PastWorkoutDetail()) {
                                    PastWorkoutCard(show: $press)
                                }.buttonStyle(PlainButtonStyle())
                            .padding(.bottom, 10)
                                PastWorkoutCard(show: $press)
                            }
                        }
                    }
                    .padding(.top, 30)
                }
                .onAppear {
                    UITableView.appearance().separatorStyle = .none
            }
                .navigationBarTitle(Text("Activity"))
            }
            if press {
                ExpandedInfoCard(press: $press)
                    .transition(.move(edge: .bottom))
                    .animation(.spring(response: 0.6, dampingFraction: 0.4, blendDuration: 0))
            }
            
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
