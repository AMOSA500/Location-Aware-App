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
    @State private var lender = ""
    @State private var amount = ""
    @State private var interest = ""
    @State private var period = ""
    
    var body: some View {
        
        VStack{
            Label("", systemImage: "sterlingsign.bank.building")
            Text("Mortgage Calculator").font(.system(size: 24)).bold()
            
            InputView(value: $lender, label: "Lender", symbol: "house.fill", placeholder: "none", isNumberField: false)
            
            InputView(value: $amount, label: "Amount", symbol: "sterlingsign", placeholder: "0", isNumberField: true)
            
            InputView(value: $interest, label: "Interest", symbol: "percent", placeholder: "0", isNumberField: true)
            
            InputView(value: $period, label: "Period (years)", symbol: "calendar", placeholder: "0", isNumberField: true)
            
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .foregroundColor(Color.blue)
                Text("Calculate Payment").font(.system(size: 14)).foregroundColor(Color.white)
            }.padding(.top,20)
        }.padding()
        
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
    MainTabView()
}
