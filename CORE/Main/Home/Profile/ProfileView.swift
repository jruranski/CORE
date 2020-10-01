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
    @State var showSettings: Bool = false
    @State var showAccount: Bool = false
    @State var showInfo: Bool = false
    @State var showContact: Bool = false
    
    var items = ["Profile", "Account", "Settings", "Info", "Contact"]
    var icons = ["person.circle", "creditcard.circle", "gear", "info.circle", "envelope.circle"]
    
    
    func listFunctions(index: Int) {
        print(index)
        if index == 0 {
            showAdjustments.toggle()
        }else if index == 1 {
            showAccount.toggle()
        }else if index == 2 {
            showSettings.toggle()
        }else if index == 3 {
            showInfo.toggle()
        }else{
            showContact.toggle()
        }
    }
    
    
    var body: some View {
        
        
        ZStack {
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
                    if showContact {
                        ContactView(showContact: $showContact)
                    }else{
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
                    .transition(.move(edge: .bottom))
                    .animation(.easeInOut)
                    }
                    }
                }
                .frame(width: showContact ? screenWidth - 45 : screenWidth - 20, height: showContact ? 240 : 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .animation(.easeInOut)
                .background(Color(.systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 30.0))
                .shadow(radius: 20)
                .overlay(
                    showContact ? nil :
                    HStack {
                        Image("activityAbsDummy")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 128, height: 128, alignment: .center)
                            .clipShape(Circle())
                            
                        
                    }.offset(y: -200)
                    .shadow(radius: 10)
                        
                )
//                .frame(height: showContact ? 180 : 400)
//                HStack {
//                    ForEach(logos, id: \.self) { logo in
//                        Image(uiImage: UIImage(named: logo) ?? UIImage())
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//
//                            .frame(width: 48, height: 48, alignment: .center)
//                    }
//                }
                
                
            }
            .background(
                Color(.systemBackground)
//                BlurView(style: .systemThickMaterial)
            )
            .offset(y: showAdjustments ? -100 : 0)
            .offset(y: showSettings ? -1000 : 0)
            .offset(x: showAccount ? -500 : 0)
            .offset(y: showInfo ? 1000 : 0)
            .animation(.spring(response: 0.6, dampingFraction: 0.4, blendDuration:  0))
            
            
            if showSettings {
                SettingsView(showSettings: $showSettings)
                    .transition(.move(edge: .bottom))
                    .animation(.spring(response: 0.6, dampingFraction: 0.4, blendDuration: 0))
            }
            
            
        }.opacity(showProfile ? 1 : 0)
        .animation(.easeInOut(duration: 0.3))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(showProfile: .constant(true))
    }
}
