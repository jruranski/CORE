//
//  CustomizeWokrout.swift
//  CORE
//
//  Created by Jakub Ruranski on 02/08/2020.
//

import SwiftUI

struct CustomizeWorkout: View {
    var opacity = 0.5
    var rows = [
        GridItem(.adaptive(minimum: 80, maximum: 130)),
                 GridItem(.adaptive(minimum: 80, maximum: 130))
    ]
    
   @State var titleString: String = ""
    
    
    func save() {
        
    }
    
    func exit() {
        
    }
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    HStack(spacing: 2) {
                        Button(action: {exit()}) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 24, weight: .medium, design: .rounded))
                            .foregroundColor(Color(.label))
                        }
                        Text("Create a new workout")
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                    }
                    
                    Text("Choose muscle groups to workout")
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .opacity(opacity)
                }
                Spacer()
                
                
            }
            .padding()
            .padding(.top, 5)
            ScrollView(.horizontal, showsIndicators: false) {
                
                    LazyHGrid(rows: rows) /*@START_MENU_TOKEN@*/{
                    
                        ForEach(0..<9) { item in
                        MuscleCard()
                    }
                    
                }/*@END_MENU_TOKEN@*/
                .frame(width: 375, height: 250)
                    .padding(.leading, 6)
                
        }.frame(width: 375, height: 250)
        
        
        
            VStack {
                HStack {
                    Text("Title:")
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .opacity(opacity)
                    Spacer()
                }.padding(.horizontal)
                
                HStack(alignment: .center) {
                    TextField("Full body workout", text: $titleString)
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .frame(alignment: .center)
                    
                }
                
                .padding()
                .frame(width: 350, height: 50, alignment: .center)
                .background(Color(.systemGroupedBackground))
                .cornerRadius(10)
            }
            
            HStack {
                VStack {
                    HStack {
                        Text("Start time:")
                            .font(.system(size: 16, weight: .medium, design: .rounded))
                            .opacity(opacity)
                        Spacer()
                    }.padding(.horizontal)
                    
                    HStack(alignment: .center) {
                        TextField("TUE, 10:00AM", text: $titleString) // change
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .frame(alignment: .center)
                        
                    }
                    
                    .padding()
                    .frame(width: 170, height: 50, alignment: .center)
                    .background(Color(.systemGroupedBackground))
                    .cornerRadius(10)
                }
                
                
                VStack {
                    HStack {
                        Text("End time:")
                            .font(.system(size: 16, weight: .medium, design: .rounded))
                            .opacity(opacity)
                        Spacer()
                    }.padding(.horizontal)
                    
                    HStack(alignment: .center) {
                        TextField("TUE, 10:00AM", text: $titleString) //change
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .frame(alignment: .center)
                        
                    }
                    
                    .padding()
                    .frame(width: 170, height: 50, alignment: .center)
                    .background(Color(.systemGroupedBackground))
                    .cornerRadius(10)
                }
            }
            
            HStack {
                VStack {
                    HStack {
                        Text("Location:")
                            .font(.system(size: 16, weight: .medium, design: .rounded))
                            .opacity(opacity)
                        Spacer()
                    }.padding(.horizontal)
                    
                    HStack(alignment: .center) {
                        TextField("GYM", text: $titleString) // change
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .frame(alignment: .center)
                        
                    }
                    
                    .padding()
                    .frame(width: 170, height: 50, alignment: .center)
                    .background(Color(.systemGroupedBackground))
                    .cornerRadius(10)
                }
                
                
                VStack {
                    HStack {
                        Text("Goal:")
                            .font(.system(size: 16, weight: .medium, design: .rounded))
                            .opacity(opacity)
                        Spacer()
                    }.padding(.horizontal)
                    
                    HStack(alignment: .center) {
                        TextField("600kcal", text: $titleString) //change
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .frame(alignment: .center)
                        
                    }
                    
                    .padding()
                    .frame(width: 170, height: 50, alignment: .center)
                    .background(Color(.systemGroupedBackground))
                    .cornerRadius(10)
                    
                }
            }
            
            VStack {
                HStack {
                    Button(action: {save()}) {
                        Text("Save")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                    }.padding()
                }.frame(width: 350, height: 60, alignment: .center)
                .background(Color.red)
                .cornerRadius(20)
                .padding()
            }
//            .edgesIgnoringSafeArea(.all)
            .frame(width: 375) //change
            .frame(maxHeight: .infinity)
            .background(Color(.systemBackground))
            .cornerRadius(30, corners: [.topLeft, .topRight])
            .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: -14)
            .padding(.top)
            
            Spacer()
        }
    }
}

struct CustomizeWokrout_Previews: PreviewProvider {
    static var previews: some View {
        CustomizeWorkout()
    }
}
