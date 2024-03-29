//
//  SearchBar.swift
//  CORE
//
//  Created by Jakub Ruranski on 27/07/2020.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    
    @State private var isEditing = false
    
    var body: some View {
        HStack {
            HStack {
                TextField("Search ...", text: $text)
                    .font(.system(size: 16, design: .rounded))
                .padding(.all, 7)
                .padding(.horizontal, 25)
                .background(Color.white)
                .cornerRadius(15)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 8)
                            
                            if isEditing {
                                Button(action: {
                                    self.text = ""
                                }) {
                                    Image(systemName: "multiply.circle.fill")
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 8)
                                }
                            }
                        }
                    )
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
            }
            }.modifier(ShadowModifier())
        
        if isEditing {
            Button(action: {
                self.isEditing = false
                self.text = ""
            }) {
                Text("Cancel")
            }
            .padding(.trailing, 10)
            .transition(.move(edge: .trailing))
            .animation(.default)
        }
        }
        
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
