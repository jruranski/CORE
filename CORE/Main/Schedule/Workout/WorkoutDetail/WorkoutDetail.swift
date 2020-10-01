//
//  WorkoutDetail.swift
//  CORE
//
//  Created by Jakub Ruranski on 25/07/2020.
//

import SwiftUI

struct WorkoutDetail: View {
    
    @Binding var showDetail: Bool
    @State var setShow: Bool = false
    @State var setString: String = "8"
    @State var repsShow: Bool = false
    @State var repsString: String = "8"
    @State var weightShow: Bool = false
    @State var weightString: String = "50"
    
    var category = "Sets"
    var text = "4"
    
    var workout: Workout?
    var exercise: Exercise?
    
    var body: some View {
        ZStack {
            ZStack {
            ZStack {
                VStack {
                    Image(exercise?.gifName ?? "activityAbsDummy")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: screenWidth, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
                .edgesIgnoringSafeArea(.top)
                
                
                
                
                
            }
            
            
            
            VStack {
                VStack {
                    HStack {
                        Button(action: { showDetail.toggle()}) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .semibold, design: .rounded))
                        }
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
                    
                    Text(exercise?.name ?? "Squats")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                    HStack(spacing: 10) {
                        Button(action: {setShow.toggle()}) {
                            InfoBigCard(category: "Sets", text: setString, color: Color(.systemOrange))
                        }.buttonStyle(PlainButtonStyle())
                        Spacer()
                        Button(action: { repsShow.toggle()}) {
                            InfoBigCard(category: "Reps", text: repsString, color: Color(.systemRed))
                        }.buttonStyle(PlainButtonStyle())
                        Spacer()
                        
                        Button(action:{ weightShow.toggle()}){
                            InfoBigCard(category: "Weight", text: "\(weightString)kg", color: Color(.systemBlue))
                        }.buttonStyle(PlainButtonStyle())                    }
                    .padding(.horizontal, 16)
                    
                    WorkoutSummaryCard()
                    
                    
                    Button(action: {setCompleted()}) {
                        VStack {
                            Text("SET COMPLETED")
                                .font(.system(size: 24, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        }
                        .frame(width: screenWidth - 20, height: 74, alignment: .center)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing) // change colors
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 37, style: .continuous))
//                        .shadow(color: Color.red.opacity(0.3), radius: 10, y: -2)
                    }
                    .padding(.bottom, 10)
                    
                    
                }
                
                .frame(width: screenWidth, height: 540, alignment: .bottom)
                .background(Color.white)
                .cornerRadius(30, corners: [.topLeft, .topRight])
                
            }
            }.opacity(setShow ? 0 : 1)
            .opacity(repsShow ? 0 : 1)
            .opacity(weightShow ? 0 : 1)
            .animation(.linear)
//            .edgesIgnoringSafeArea(.all)
            //            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            
            if setShow {
                NumberChangeView(show: $setShow, string: $setString, suffix: .constant(""))
                    .animation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0))
                    .transition(.move(edge: .bottom))
            }
            if repsShow {
                NumberChangeView(show: $repsShow, string: $repsString, suffix: .constant(""))
                    .animation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0))
                    .transition(.move(edge: .bottom))
            }
            if weightShow {
                NumberChangeView(show: $weightShow, string: $weightString, suffix: .constant("kg"))
                    .animation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0))
                    .transition(.move(edge: .bottom))
            }
            
        }
    
    }
    
    
    func setCompleted() {
        
    }
}

struct WorkoutDetail_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDetail(showDetail: .constant(false))
    }
}
