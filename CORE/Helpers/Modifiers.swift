//
//  Modifiers.swift
//  CORE
//
//  Created by Jakub Ruranski on 21/07/2020.
//


import SwiftUI


struct ShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color(.label).opacity(0.15), radius: 10, y: 8)
            .shadow(color: Color(.label).opacity(0.15), radius: 1, y: 1)
    }
}


struct FontModifier: ViewModifier {
    
    var style: Font.TextStyle = .body
    
    func body(content: Content) -> some View {
        content
            .font(.system(style, design: .rounded))
    }
        }
