//
//  SettingsView.swift
//  CORE
//
//  Created by Jakub Ruranski on 07/09/2020.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var showSettings: Bool
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    HStack {
                        HStack(spacing: 2) {
                            Button(action: { showSettings.toggle()}) {
                                Image(systemName: "chevron.left")
                                    .font(.system(size: 26, weight: .bold, design: .rounded))
                            }.buttonStyle(PlainButtonStyle())
                                Text("Settings")
                //                    .padding()
                                    .font(.system(size: 30, weight: .bold, design: .rounded))
                                Spacer()
                                
                        }
    //                    Button(action: {}) {
    //                    Text("Save")
    //                        .font(.system(size: 20, weight: .bold, design: .rounded))
    //                    }
                        
                    }
                    }
                    .padding(.horizontal, 10)
                    .padding(.leading , 8)
                .padding(.top, 30)
                
                
                Form {
                    Section(header: Text("Workouts")) {
                    List {
                        ForEach(1..<5) { i in
                            SettingsRow(isOn: $showSettings, title: "Auto-Skip timer")
                        }
                        
                        
                    }
                    }
                    List {
                        ForEach(1..<5) { i in
                            SettingsRow(isOn: $showSettings, title: "Auto-Skip timer")
                        }
                        
                        
                    }
                }
                
                
                
                
                Spacer()
            }
            
        }
        .background(
            Color(.systemGroupedBackground)
                .edgesIgnoringSafeArea(.all)
                
        )
        
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(showSettings: .constant(false))
    }
}
