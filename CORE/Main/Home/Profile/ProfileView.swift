//
//  ProfileView.swift
//  CORE
//
//  Created by Jakub Ruranski on 29/07/2020.
//

import SwiftUI

struct ProfileView: View {
    
    @Binding var showProfile: Bool
    
    @State var showAdjustments: Bool = false
    
    
    var items = ["Profile", "Account", "Settings", "Info", "Contact"]
    var icons = ["person.circle", "creditcard.circle", "gear", "info.circle", "envelope.circle"]
    var logos = ["facebook", "instagram", "twitter", "gmail"]
    
    func listFunctions(index: Int) {
        print(index)
        if index == 0 {
            showAdjustments.toggle()
        }
    }
    
    
    var body: some View {
        
        
        VStack {
            
            HStack {
                Button(action: {showProfile.toggle()}) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 24, weight: .semibold, design: .rounded))
                    .foregroundColor(Color(.label))
                }.buttonStyle(PlainButtonStyle())
                Spacer()
            }
            .padding()
            
            
            
            
            VStack {
                
                if showAdjustments {
                    ChangeProfile(show: $showAdjustments, nameString: "John", gender: "Male", height: "183cm", weight: "73kg")
                        .transition(.move(edge: .bottom))
                        .animation(.spring(response: 0.6, dampingFraction: 0.5, blendDuration: 0))
                        .offset(y:30)
                }else{
                
                List(items.indices) { item in
                    
                        HStack {
                            Image(systemName: icons[item])
                                .font(.system(size: 28, weight: .light))
                            Text(items[item])
                                .font(.system(size: 28, weight: .semibold, design: .rounded))
                                .padding(8)
                        }
                        .onTapGesture {
                            listFunctions(index: item)
                        }
                    
                }.padding()
                .offset(y:50)
                .opacity(showAdjustments ? 0 : 1)
                .transition(.move(edge: .top))
                .animation(.easeInOut)
                }
            }
            .frame(width: 350, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 30.0))
            .shadow(radius: 20)
            .overlay(
                
                HStack {
                    Image("activityAbsDummy")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 128, height: 128, alignment: .center)
                        .clipShape(Circle())
                    
                }.offset(y: -200)
                .shadow(radius: 10)
            )
            HStack {
                ForEach(logos, id: \.self) { logo in
                    Image(uiImage: UIImage(named: logo) ?? UIImage())
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        
                        .frame(width: 48, height: 48, alignment: .center)
                }
            }
            
            
        }.background(Color(.systemBackground))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(showProfile: .constant(false))
    }
}
