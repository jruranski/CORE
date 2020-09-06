//
//  ArticleView.swift
//  CORE
//
//  Created by Jakub Ruranski on 02/09/2020.
//

import SwiftUI

struct ArticleView: View {
    
    @Binding var show: Bool
     var articleName: String = "Cardio alone won't help you lose fat"
     var articleText: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vel porttitor enim, eu maximus lacus. Suspendisse odio mauris, sodales at quam nec, mollis auctor erat. Nulla ut nunc luctus, luctus purus vel, suscipit turpis"
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    HStack {
                        HStack(alignment: .top, spacing: 3) {
                            Button(action: { show.toggle()}) {
                                Image(systemName: "chevron.left")
                                    .font(.system(size: 26, weight: .bold, design: .rounded))
                                    .padding(.top, 7)
                            }.buttonStyle(PlainButtonStyle())
                            HStack(alignment: .top) {
                                Text(articleName)
                    //                    .padding()
                                    .font(.system(size: 28, weight: .bold, design: .rounded))
                                    .frame(height: 100, alignment: .top)
                            }
                                    
                            
                            
                            
                            
                            
                            
                            
                            
                                Spacer()
                                
                        }
                       
                    }
                    }
                    .padding(.horizontal, 10)
                    .padding(.leading , 8)
                .padding(.top, 30)
//                .padding(.bottom, 40)
                Image("activityAbsDummy")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 375, height: 180, alignment: .center)
                    .clipped()
                   
                
                
                Text(articleText)
                    .font(.system(size: 14, weight: .regular, design: .rounded))
                Spacer()
            }
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(show: .constant(true))
    }
}
