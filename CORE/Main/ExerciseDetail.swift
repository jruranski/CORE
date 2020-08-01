//
//  ExerciseDetail.swift
//  CORE
//
//  Created by Jakub Ruranski on 25/07/2020.
//

import SwiftUI

struct ExerciseDetail: View {
    var body: some View {
        ZStack {
            
            ZStack {
                VStack {
                    Image("activityAbsDummy")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 375, height: 300, alignment: .center)
                    Spacer()
                }
                .edgesIgnoringSafeArea(.top)
                
                
                
                
                
            }
            
            
            
            VStack {
                VStack {
                    HStack {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .semibold, design: .rounded))
                        Spacer()
                        
                        Image(systemName: "info.circle.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                            .offset(x: 0, y: -3)
                    }
                    .padding(.horizontal, 10)
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "play.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .medium, design: .rounded))
                        Spacer()
                        
                        Text("3D")
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .medium, design: .rounded))
                    }
                    .padding(.horizontal, 10)
                }
                
                
                
                Spacer()
                VStack(spacing: 16) {
                    
                    Spacer()
                    
                    Text("Squats")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                    
                    .padding(.horizontal, 16)
                    
                    Text("Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod.")
                        .font(.system(size: 14, weight: .regular, design: .rounded))
                        .padding(.horizontal, 10)
                    Spacer()
                    
                    VStack(spacing: 10) {
                    HStack(spacing: 10) {
                        InfoBigCard()
                        Spacer()
                        InfoBigCard(category: "Reps", text: "12")
                        Spacer()
                        InfoBigCard(category: "Weight", text: "50kg")
                    }
                    .padding(.horizontal, 20)
                    
                    
                    Button(action: {}) {
                        VStack {
                            Text("Add to my workout")
                                .font(.system(size: 24, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        }
                        .frame(width: 350, height: 74, alignment: .center)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.0654547736, green: 0.2786159813, blue: 0.9171175957, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.9708442092, blue: 0.9009542465, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing) // change colors
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 37, style: .continuous))
//                        .shadow(color: Color.red.opacity(0.3), radius: 10, y: -2)
                    }
                    .padding(.bottom, 10)
                    }
                    .frame(width: 375, height: 220, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.white) // change 4 dm
                    .cornerRadius(30, corners: [.topLeft, .topRight])
                    .shadow(color: Color.black.opacity(0.2), radius: 10)
                }
                .edgesIgnoringSafeArea(.bottom)
                
                .frame(width: 375, height: 540, alignment: .bottom)
                .background(Color.white)
                .cornerRadius(30, corners: [.topLeft, .topRight])
                
                
            }
            
//            .edgesIgnoringSafeArea(.all)
            //            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        }
    
    }
}

struct ExerciseDetail_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseDetail()
    }
}
