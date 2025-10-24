//
//  InputView.swift
//  Mortgage
//
//  Created by Nafiu Amosa on 23/10/2025.
//

import SwiftUI

struct InputView: View {
    @Binding var value: String
    var label: String
    var symbol: String
    var placeholder: String
    var isNumberField: Bool
    
    var body: some View {
        HStack(alignment: .center, spacing: 20){
            Label(label, systemImage: symbol).frame(width: 150, alignment: .leading)
            TextField(placeholder, text: $value)
                .padding(.horizontal, 10)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .keyboardType(isNumberField ? .decimalPad : .default)
                .border(.black, width: 1)
                .textFieldStyle(DefaultTextFieldStyle())
                
        }
    }
}


