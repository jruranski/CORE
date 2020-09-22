//
//  TabBar.swift
//  CORE
//
//  Created by Jakub Ruranski on 10/08/2020.
//

import SwiftUI
import BottomBar_SwiftUI
import CoreData

let items: [BottomBarItem] = [

    BottomBarItem(icon: "house", title: "Home", color: .red),
    BottomBarItem(icon: "rectangle.3.offgrid", title: "Schedule", color: .blue),
    BottomBarItem(icon: "magnifyingglass", title: "Explore", color: .orange),
    BottomBarItem(icon: "bolt.heart", title: "Activity", color: .purple)

]



struct TabBar: View {
    
    @Environment(\.managedObjectContext) private var managedObjectContext
    
    
    @State var selectedIndex: Int = 0
    
    var body: some View {
//        TabView {
//            HomeView(showProfile: false, showLocations: false, showWorkout: false)
//                .tabItem {
//                    Image(systemName: "house.fill")
//                    Text("Home")
//
//
//                }
//            ScheduleView(showAdd: false, showWorkout: false)
//                .tabItem {
//                    Image(systemName: "rectangle.3.offgrid.fill")
//                    Text("Schedule")
//                }
//            ExploreView()
//                .tabItem {
//                    Image(systemName: "magnifyingglass")
//                    Text("Explore")
//                }
//            ActivityView()
//                .tabItem {
//                    Image(systemName: "bolt.heart.fill")
//                        Text("Activity")
//                }
//        }.onAppear {
//            UITabBar.appearance().backgroundColor = .systemBackground
//            UITabBar.appearance().tintColor = #colorLiteral(red: 1, green: 0.2600502968, blue: 0.1722270846, alpha: 1)
//        }
        
        VStack {
            
            switch selectedIndex {
            case 0:
                HomeView().environment(\.managedObjectContext, managedObjectContext)
            case 1:
                ScheduleView().environment(\.managedObjectContext, managedObjectContext)
            case 2:
                ExploreView().environment(\.managedObjectContext, managedObjectContext)
            case 3:
                ActivityView().environment(\.managedObjectContext, managedObjectContext)
            default:
                HomeView().environment(\.managedObjectContext, managedObjectContext)
            }
            
            
            
            BottomBar(selectedIndex: $selectedIndex, items: items)
                .edgesIgnoringSafeArea(.bottom)
                .padding(.top, -15)
                
//                .frame(height: 100)
//                .offset(y: 50)
        }.background(Color.clear)
        
        
        
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}


extension UINavigationController {
    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        topViewController?.hidesBottomBarWhenPushed = true
    }
}
