//
//  NumberChangeView.swift
//  CORE
//
//  Created by Jakub Ruranski on 18/08/2020.
//

import SwiftUI

struct NumberChangeView: View {
    @Binding var show: Bool
    @Binding var string: String
    @Binding var suffix: String
    
    
    var prevString: String = ""
    var body: some View {
        ZStack {
            
            VStack(spacing: 20) {
                
                TextField(string, text: $string)
                    .font(.system(size: 100, weight: .heavy, design: .rounded))
                    .padding()
                    .multilineTextAlignment(.center)
                    .textContentType(.oneTimeCode)
                    .keyboardType(.numberPad)
                    .foregroundColor(.white)
                    
                HStack(spacing: 60) {
                    
                    Button(action: {
                        self.string = "8"
                        show.toggle()
                        
                    }) {
                        VStack {
                            Image(systemName: "xmark")
                                .font(.system(size: 20, weight: .heavy, design: .rounded))
                                .foregroundColor(Color(.systemRed))
                                .blendMode(.hardLight)
                        }.frame(width: 64, height: 64, alignment: .center)
                        .background(Color(.systemBackground))
                        .cornerRadius(32)
                        .modifier(ShadowModifier())
                    }
                    
                    
                    Button(action: { show.toggle()}) {
                        VStack {
                            Text("Save")
                                .font(.system(size: 20, weight: .heavy, design: .rounded))
                                .foregroundColor(Color(.label))
                        }.frame(width: 64, height: 64, alignment: .center)
                        .background(Color(.systemBackground))
                        .cornerRadius(32)
                        .modifier(ShadowModifier())
                    }
                    
                   
                }
            }
            
        }
        .edgesIgnoringSafeArea(.all)
        .frame(width: 375, height: 1200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            ZStack {
//            BlurView(style: .systemMaterial)
            Color(.systemRed)
            })
//        .blendMode(.hardLight)
        .opacity(1)
        .onAppear {
//            self.prevString = self.string
        }
    }
}

struct NumberChangeView_Previews: PreviewProvider {
    static var previews: some View {
        NumberChangeView(show: .constant(false), string: .constant(""), suffix: .constant(""))
    }
}
