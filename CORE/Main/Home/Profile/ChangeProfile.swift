//
//  ChangeProfile.swift
//  CORE
//
//  Created by Jakub Ruranski on 06/09/2020.
//

import SwiftUI

struct ChangeProfile: View {
    
    @Binding var show: Bool
    
    @State var nameString: String
    @State var gender: String
    @State var height: String
    @State var weight: String
    
    
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Name:")
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .opacity(0.6)
                    Spacer()
                }
    //            .padding(.horizontal)
                
                HStack(alignment: .center) {
                    TextField("John", text: $nameString)
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .frame(alignment: .center)
                    
                }
                
                .padding()
                .frame(width: 320, height: 50, alignment: .center)
                .background(Color(.systemGroupedBackground))
                .cornerRadius(10)
                
            }.frame(width: 320)
            
            HStack {
                VStack {
                    HStack {
                        Text("Height:")
                            .font(.system(size: 16, weight: .medium, design: .rounded))
                            .opacity(0.6)
                        Spacer()
                    }
        //            .padding(.horizontal)
                    
                    HStack(alignment: .center) {
                        TextField("183cm", text: $height)
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .frame(alignment: .center)
                            .keyboardType(.numberPad)
                    }
                    
                    .padding()
                    .frame(width: 140, height: 50, alignment: .center)
                    .background(Color(.systemGroupedBackground))
                    .cornerRadius(10)
                    
                }.frame(width: 140)
                
                Spacer()
                VStack {
                    HStack {
                        Text("Weight:")
                            .font(.system(size: 16, weight: .medium, design: .rounded))
                            .opacity(0.6)
                        Spacer()
                    }
        //            .padding(.horizontal)
                    
                    HStack(alignment: .center) {
                        TextField("73kg", text: $weight)
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .frame(alignment: .center)
                            .keyboardType(.numberPad)
                            
                    }
                    
                    .padding()
                    .frame(width: 140, height: 50, alignment: .center)
                    .background(Color(.systemGroupedBackground))
                    .cornerRadius(10)
                    
                }.frame(width: 140)
            }.frame(width: 320)
            
            VStack {
                HStack {
                    Text("Name:")
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .opacity(0.6)
                        
                    Spacer()
                }
    //            .padding(.horizontal)
                
                HStack() {
                    Text(gender)
                        .font(.system(size: 18, weight: .bold, design: .rounded))
//                        .frame(alignment: .center)
                        
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                
                .padding()
                .frame(width: 320, height: 50, alignment: .center)
                .background(Color(.systemGroupedBackground))
                .cornerRadius(10)
                
            }.frame(width: 320)
            
            
            
            
                HStack {
                    Button(action: {show.toggle()}) {
                        Text("Save")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                    }.padding()
                }.frame(width: 280, height: 60, alignment: .center)
                .background(Color.red)
                .cornerRadius(20)
                
            
//            .edgesIgnoringSafeArea(.all)
            
            
            
        }
        
    }
}

struct ChangeProfile_Previews: PreviewProvider {
    static var previews: some View {
//        ChangeProfile(nameString: .constant(""), gender: .constant("Male"), height: .constant("183cm"), weight: .constant("73kg"))
        Text("")
    }
}
