//
//  ExploreView.swift
//  CORE
//
//  Created by Jakub Ruranski on 22/07/2020.
//

import SwiftUI

struct ExploreView: View {
    
    
    @State var showBookmarks: Bool = false
    
    var body: some View {
        ZStack {
            NavigationView {
                ScrollView {
                    VStack {
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(1..<6) { _ in // add values
                                    HStack {
                                        NavigationLink(destination: PresetWorkoutDetail()) {
                                        BigWorkoutCard()
                                        }.buttonStyle(PlainButtonStyle())
                                    }
                                }
                                
                            }
                            .frame(width: 320, height: 275)
                            
                            .padding(.all, 30)
                            .padding(.top, -20)
    //                        .padding(.leading, 10)
                            .padding(.bottom, -20)
                        }
                        
                        
                        ForEach(1..<3) { _ in
                        
                        SmallTitle(text: "For You", description: "Workouts that perfectly suit your goals and needs")

                        // discover section
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(1..<4) { _ in
                                    
                                    GeometryReader { geometry in
                                        VStack {
                                            NavigationLink(destination: PresetWorkoutDetail()) {
                                        ExploreSmallCard()
                                            .rotation3DEffect(
                                                .degrees(Double(geometry.frame(in: .global).minX - 30) / -20),
                                                axis: (x: 0.0, y: 10.0, z: 0.0),
                                                anchor: .center,
                                                anchorZ: 0.0,
                                                perspective: 1.0
                                            )
                                            
                                            }.buttonStyle(PlainButtonStyle())
                                            
                                        Text("60min Workout")
                                            .frame(alignment: .leading)
                                            .font(.system(size: 14, weight: .light, design: .rounded))
                                            .opacity(0.6)
                                            .padding(.top, 10)
        //                                    .rotation3DEffect(
        //                                        .degrees(Double(geometry.frame(in: .global).minX - 30) / -15),
        //                                        axis: (x: 0.0, y: 10.0, z: 0.0),
        //                                        anchor: .center,
        //                                        anchorZ: 0.0,
        //                                        perspective: 1.0
        //                                    )
                                        }
                                        
                                    }
                                    .frame(width: 250, height: 275, alignment: .center)
                                }
                            }
                            .padding(.all, 30)
                            .padding(.bottom, -50)
                        }
                    }
                        
                        Spacer()
                    }
                    .padding(.top, 10)
                    .navigationBarTitle(Text("Explore")
                                            .font(.system(size: 30, weight: .bold, design: .rounded))
                                        , displayMode: .large)
                    .navigationBarItems(trailing:
                                            NavigationLink(destination: BookmarkView()) {
                    Image(systemName: "bookmark.fill")
                                            .padding(.trailing, 10)
        //                                    .offset(x: 0, y: 47)
                                            }.buttonStyle(PlainButtonStyle())
                )
                }
            }.opacity(showBookmarks ? 0 : 1)
            .animation(.linear)
            
            
            
            
        }
        
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
