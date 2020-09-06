//
//  StartWorkoutCard.swift
//  CORE
//
//  Created by Jakub Ruranski on 21/07/2020.
//

import SwiftUI

struct StartWorkoutCard: View {
    
    @State var show = false
    @Binding var showWorkout: Bool
    var body: some View {
        ZStack {
            
            
            Button(action: {showWorkout.toggle()}) {
                HStack {
                    Text("Start Workout")
                        .font(.system(size: 36, weight: .heavy, design: .rounded))
                        .foregroundColor(.white)
                }
                .frame(width: 325, height: 175, alignment: .center)
                .padding(.all, 10)
                .background(
                    
                    VStack {
                        ZStack {
                                
//                            Image(uiImage: #imageLiteral(resourceName: "activityAbsDummy"))
//                                .resizable()
//                                .aspectRatio(contentMode: .fill)
//                                .frame(width: 360, height: 175, alignment: .center)
//                                .offset(x: -50)
                                LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing) //add custom colors
                                    .opacity(1)
                                    .frame(width: 360)
                                    .offset(x: -38)
    //                                .edgesIgnoringSafeArea(.all)
                            
                                Image(uiImage: #imageLiteral(resourceName: "Blob"))
                                    .hueRotation(.degrees(160))
                                    .offset(x: -150, y: -200)
                                    .rotationEffect(.degrees(show ? 360 + 90 : 90), anchor: .leading)
                                    .blendMode(.plusDarker)
                                    .animation(Animation.linear(duration: 120).repeatForever(autoreverses: false))
                                    .onAppear {
                                        self.show = true
                                    }
                                
                                Image(uiImage: #imageLiteral(resourceName: "Blob"))
                                    .hueRotation(.degrees(140))
                                    .offset(x: 150, y: 150)
                                    .rotationEffect(.degrees(show ? 0 : 360), anchor: .leading)
                                    .blendMode(.overlay)
                                    .animation(Animation.linear(duration: 120).repeatForever(autoreverses: false))
                            
                            Image(uiImage: #imageLiteral(resourceName: "Blob"))
                                .hueRotation(.degrees(100))
                                .offset(x: -250, y: -100)
                                .rotationEffect(.degrees(show ? 360 + 180 : 180), anchor: .leading)
                                .blendMode(.overlay)
                                .animation(Animation.linear(duration: 120).repeatForever(autoreverses: false))
                            
                        }.frame(width: 325, height: 175)
                        .offset(x: 45)
                        .onAppear {
                            self.show = true
                        }
                        .onDisappear {
                            self.show = false
                        }
                    }
                        
                    
                
                
                ) //add custom colors) // change to image or smth
                
                .clipShape(RoundedRectangle(cornerRadius: 30.0, style: .continuous))
                .modifier(ShadowModifier())
            }
            
        }
        
    }
}

struct StartWorkoutCard_Previews: PreviewProvider {
    static var previews: some View {
        StartWorkoutCard(showWorkout: .constant(false))
    }
}
