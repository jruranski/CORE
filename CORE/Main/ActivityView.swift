//
//  ActivityView.swift
//  CORE
//
//  Created by Jakub Ruranski on 27/07/2020.
//

import SwiftUI

struct ActivityView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 30) {
                    ActivityCard()
                    VStack(spacing: 0) {
                    ActivitySeparator()
                        .padding(.bottom, 10)
                        .padding(.top, 10)
                        VStack(spacing: 20) {
                    PastWorkoutCard()
                        .padding(.bottom, 10)
                        PastWorkoutCard()
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
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
