//
//  TabBar.swift
//  CORE
//
//  Created by Jakub Ruranski on 10/08/2020.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                    
            
                }
            ScheduleView(showAdd: false, showWorkout: false)
                .tabItem {
                    Image(systemName: "rectangle.3.offgrid.fill")
                    Text("Schedule")
                }
            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Explore")
                }
            ActivityView()
                .tabItem {
                    Image(systemName: "bolt.heart.fill")
                        Text("Activity")
                }
        }.onAppear {
            UITabBar.appearance().backgroundColor = .systemBackground
            UITabBar.appearance().tintColor = #colorLiteral(red: 1, green: 0.2600502968, blue: 0.1722270846, alpha: 1)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
