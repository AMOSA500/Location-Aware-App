//
//  MortgageMainView.swift
//  Mortgage
//
//  Created by Philip Trwoga on 14/10/2024 and October 2025
// Mock Test 

import SwiftUI
import SwiftData

struct MortgageMainView: View {
// your vars here - use types mapped to the function so only use string for Lender
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        
        VStack{
            Text("Mortgage Calculator")
            //your code here for main UI
            //pattern is:
            //labels and textfields
            //button
            //payment output
            //hint: use this for non-text var  TextField("Enter amount", value: $amount, format: .number)
        }
        //    }

                
    }
    //uncomment this function when ready
    /*
     //function for button
     func calculateMortgage() {
     let principal = max(0,amount)
     let annualRate = max(0,interestPercent) / 100.0
     let monthlyRate = annualRate / 12.0
     let n = Double(max(0,periodYears) * 12)
     //check values are not zero
     guard principal > 0, n > 0
     else {
     payment = nil
     hideKeyboard()
     return
     }
     
     // Handle zero-interest case to avoid a divide-by-zero
     if monthlyRate == 0 {
     payment = principal / n
     } else {
     let factor = pow(1.0 + monthlyRate, n)
     payment = (principal * monthlyRate * factor) / (factor - 1.0)
     }
     
     //save quote - your code here
     //create and insert a model
     //finished so hide the keyboard
     hideKeyboard()
     }
     */
    
    //uncomment this function when ready - call this function to hide the keyboard
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}

#Preview {
    MortgageMainView()
}
