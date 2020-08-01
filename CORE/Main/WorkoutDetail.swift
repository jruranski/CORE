//
//  WorkoutDetail.swift
//  CORE
//
//  Created by Jakub Ruranski on 25/07/2020.
//

import SwiftUI

struct WorkoutDetail: View {
    
    var category = "Sets"
    var text = "4"
    
    
    
    var body: some View {
        ZStack {
            
            ZStack {
                VStack {
                    Image("activityAbsDummy")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 375, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
                    HStack(spacing: 10) {
                        InfoBigCard()
                        Spacer()
                        InfoBigCard(category: "Reps", text: "12")
                        Spacer()
                        InfoBigCard(category: "Weight", text: "50kg")
                    }
                    .padding(.horizontal, 16)
                    
                    WorkoutSummaryCard()
                    
                    
                    Button(action: {}) {
                        VStack {
                            Text("SET COMPLETED")
                                .font(.system(size: 24, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        }
                        .frame(width: 350, height: 74, alignment: .center)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing) // change colors
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 37, style: .continuous))
//                        .shadow(color: Color.red.opacity(0.3), radius: 10, y: -2)
                    }
                    .padding(.bottom, 10)
                    
                    
                }
                
                .frame(width: 375, height: 540, alignment: .bottom)
                .background(Color.white)
                .cornerRadius(30, corners: [.topLeft, .topRight])
                
                
            }
            
//            .edgesIgnoringSafeArea(.all)
            //            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        }
    
    }
}

struct WorkoutDetail_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDetail()
    }
}
