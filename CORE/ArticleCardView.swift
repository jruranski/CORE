//
//  ArticleCardView.swift
//  CORE
//
//  Created by Jakub Ruranski on 21/07/2020.
//

import SwiftUI

struct ArticleCardView: View {
    var body: some View {
        VStack {
            VStack(spacing: 0) {
                
                Image("activityAbsDummy")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    
                    .frame(width: 330, height: 165, alignment: .center)
//                    .padding(.bottom, 30)
                    .clipped()
                    .offset(x: 0, y: -30)
//                Spacer()
                VStack(alignment: .leading) {
                    
                    HStack(spacing: 2) {
                        Image(systemName: "heart.fill")
                            .font(.system(size:11, weight: .semibold, design: .rounded ))
                        Text("Diet")
                            .font(.system(size:12, weight: .semibold, design: .rounded ))
                    }
                    .foregroundColor(.red)
                    
                    Text("Cardio alone won't help you lose fat")
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                        .padding(.bottom, 5)
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vel porttitor enim, eu maximus lacus. Suspendisse odio mauris, sodales at quam nec, mollis auctor erat. Nulla ut nunc luctus, luctus purus vel, suscipit turpis…")
                    .font(.system(size: 11, weight: .regular, design: .rounded))
                }
                .padding(.horizontal, 10)
                .offset(x: 0, y: -20)
                
            }
//            .padding(.all, 10)
        }
        .frame(width: 330, height: 275, alignment: .center)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(radius: 20)
        
    }
}

struct ArticleCardView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCardView()
    }
}
