//
//  ContentView.swift
//  CORE
//
//  Created by Jakub Ruranski on 19/07/2020.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
//        NavigationView {
        ScrollView {
            VStack {
                VStack {
                        HStack {
                            Text("Today")
            //                    .padding()
                                .font(.system(size: 30, weight: .bold, design: .rounded))
                            Spacer()
                            
                            Image(systemName: "person.crop.circle.fill")
                                .renderingMode(.original)
                                .font(.system(size: 18))
                //                .aspectRatio(contentMode: .fit)
                                .padding(.all,  2)
                                .frame(width: 36, height: 36, alignment: .center)
                                .background(Color.white)
                                .clipShape(Circle())
                                .modifier(ShadowModifier())
                            
                            Button(action: {}, label: {
                                HStack(spacing: 2) {
                                    Image(systemName: "mappin.circle.fill")
                                        .resizable()
                                        .foregroundColor(.black) // need to change to darkmode
                                        .frame(width: 18, height: 18, alignment: .center)
                                    Text("Gym")
                                        .foregroundColor(.black) // change for dmode
                                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                                        .frame(width: 48, height: 36, alignment: .center)
                                }
                //                .padding(.horizontal, 10)
                                .frame(width: 54, height: 36, alignment: .center)
                                .padding(.horizontal, 16)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                //                .shadow(color: Color.black.opacity(0.3), radius: 15, y: 6)
                                .modifier(ShadowModifier())
                                
                            })
                        }
                        
                        
                        
                        
                        
                        
                        
                        
                    }
                    .padding(.horizontal, 10)
                    .padding(.leading , 14)
                .padding(.top, 30)
                
                
                Text("Good morning Jack! You have a workout planned for today, shall we get started?")
                    .padding(.all, 10)
                    .font(.system(size: 16,weight: .medium, design: .rounded))
                
                StartWorkoutCard()
                    .padding(.vertical, 20)
                
                
                SmallTitle(text: "Recommended", description: "Discover new workouts")
                
                
                
                // discover section
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(1..<4) { _ in
                            
                            GeometryReader { geometry in
                                ExploreSmallCard()
                                    .rotation3DEffect(
                                        .degrees(Double(geometry.frame(in: .global).minX - 30) / -20),
                                        axis: (x: 0.0, y: 10.0, z: 0.0),
                                        anchor: .center,
                                        anchorZ: 0.0,
                                        perspective: 1.0
                                    )
                            }
                            .frame(width: 250, height: 275, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                    }
                    .padding(.all, 30)
                    .padding(.bottom, -50)
                }
                SmallTitle(text: "Learn", description: "Check your progress since last week")
                
                VStack {
                    ForEach(1..<4) {_ in
                        HStack(spacing: 20) {
                            ActivitySmallCard()
                            ActivitySmallCard()
                        }
                    }
                    .padding(.vertical, 5)
                }
                .padding(.vertical, 20)
                
                
                SmallTitle(text: "Learn", description: "The best techniques and tips from our experts")
                
                ArticleCardView()
                
                
                Spacer()
                
                
            }
        }
            
//        }
            
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}