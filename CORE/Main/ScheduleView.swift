//
//  ScheduleView.swift
//  CORE
//
//  Created by Jakub Ruranski on 23/07/2020.
//

import SwiftUI

struct ScheduleView: View {
    
    @State var showAdd: Bool
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                        HStack {
                            Text("Schedule")
            //                    .padding()
                                .font(.system(size: 30, weight: .bold, design: .rounded))
                            Spacer()
                            
                            
                            
                            Button(action: {}, label: {
                                HStack(spacing: 2) {
                                    
                                    Text("Edit")
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
                            
                            Button(action: {showAdd.toggle()}) {
                            Image(systemName: "plus")
                                .renderingMode(.original)
                                .font(.system(size: 18, weight: .bold, design: .rounded))
                //                .aspectRatio(contentMode: .fit)
                                .padding(.all,  2)
                                .frame(width: 36, height: 36, alignment: .center)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
                                .modifier(ShadowModifier())
                            }
                            
                        }
                        
                        
                        
                        
                        
                        
                        
                        
                    }
                    .padding(.horizontal, 10)
                    .padding(.leading , 14)
                .padding(.top, 30)
                
                
                HStack {
                    Text("Monday")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .opacity(0.4)
                    Spacer()
                }
                .padding(.all, 10)
                .padding(.leading, 14)
                
                BigScheduleCard()
                
                
                
                
                Spacer()
            }.opacity(showAdd ? 0 : 1)
            .animation(.easeInOut)
            
            if showAdd {
                AddNewWorkoutView(showAdd: $showAdd, showDetail: false)
                    .animation(.easeInOut(duration: 0.2))
                    .transition(.move(edge: .trailing))
            }
            
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView(showAdd: false)
    }
}
