//
//  BookmarkView.swift
//  CORE
//
//  Created by Jakub Ruranski on 15/08/2020.
//

import SwiftUI

struct BookmarkView: View {
    
    
    
    var body: some View {
        List {
            ForEach(1..<6) { _ in
                NavigationLink(destination: PresetWorkoutDetail()) {
                BookmarkRow()
                }.buttonStyle(PlainButtonStyle())
            }
            .navigationBarTitle(Text("Saved"))
        }
    }
}

struct BookmarkView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkView()
    }
}

struct BookmarkRow: View {
    var body: some View {
        HStack {
            
            VStack {
                Image("aiRobotCard") // add custom string
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70, alignment: .center)
            }.frame(width: 80, height: 80, alignment: .center)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing) //add custom colors
            )
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)).opacity(0.2), radius: 20, y: 15)
            
            
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Full on burn")
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                    
                    Text("No pain no gain!")
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .opacity(0.8)
                    
                    Text("Chest and shoulders")
                        .font(.system(size: 12, weight: .light, design: .rounded))
                        .opacity(0.5)
                }
                Spacer()
//                Image(systemName: "chevron.right")
//                    .padding()
            }
        }.padding()
    }
}
