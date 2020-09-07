//
//  Settings row.swift
//  CORE
//
//  Created by Jakub Ruranski on 07/09/2020.
//

import SwiftUI

struct SettingsRow: View {
    @Binding var isOn: Bool
    var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 16, weight: .medium, design: .rounded))
            
            
            Toggle("", isOn: $isOn)
        }
        .padding()
    }
}

struct Settings_row_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRow(isOn: .constant(false), title: "Auto-Skip timer")
    }
}
