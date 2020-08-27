//
//  ExercisesView.swift
//  CORE
//
//  Created by Jakub Ruranski on 25/07/2020.
//

import SwiftUI

struct ExercisesView: View {
    
    @State var showDetail: Bool = false
    
    var body: some View {
        
            
        ZStack {
            VStack {
                    VStack {
                    SearchBar(text: .constant("")) // change to a binding value
                    
                    ScrollView(.horizontal, showsIndicators: false) {  // change
                        HStack {
                            ForEach(1..<4) { _ in
                                InfoSmallCard() //change
                            }
                        }
                        .padding(.all, 10)
                        .padding(.bottom, 20)
                    }
                    }.padding(.top, 10)
                    HStack {
                        Text("Chest")
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .opacity(0.5)
                        Spacer()
                    }.padding(.leading)
                    
                    Button(action: { showDetail.toggle()}) {
                        ExercisesCard()
                    }.buttonStyle(PlainButtonStyle())
                    
                    Spacer()
            }.opacity(showDetail ? 0 : 1)
            .animation(.linear)
            
            
            if showDetail {
                ExerciseDetail(showDetail: $showDetail)
                    .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                    .transition(.move(edge: .bottom))
            }
            
        }
            
            
                
        
    }
}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView()
    }
}
