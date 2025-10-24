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
    @AppStorage("lender") private var lender = "None"
    @AppStorage("amount") private var amount = "300000"
    @AppStorage("interest") private var interest = "4"
    @AppStorage("period") private var period = "25"
    @State var isFieldEmpty = false
    @State var statusMessage = ""
    @State var payment = 0
    
    var body: some View {
        
        
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(Color.blue)
                    .rotationEffect(Angle(degrees: 15))
                VStack{
                    Text("🏦 Mortgage Calculator").font(.system(size: 24)).bold()
                }
                
                
            }.frame(width: UIScreen.main.bounds.width * 3, height: 350)
                .offset(y: -120)
            Divider()
            InputView(value: $lender, label: "Lender", symbol: "house.fill", placeholder: "none", isNumberField: false)
            
            InputView(value: $amount, label: "Amount", symbol: "sterlingsign", placeholder: "300000", isNumberField: true)
            
            InputView(value: $interest, label: "Interest %", symbol: "percent", placeholder: "4", isNumberField: true)
            
            InputView(value: $period, label: "Period (years)", symbol: "calendar", placeholder: "25", isNumberField: true)
            
            
            Button{
                //
            }label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .foregroundColor(Color.blue)
                    Text("Calculate Payment").font(.system(size: 18)).foregroundColor(Color.white)
                }.padding(.top,20)
            }
            .alert("Error Message", isPresented: $isFieldEmpty){
                Button("OK", role: .cancel){}
            }message: {
                Text(statusMessage)
            }
            
            
            // Display Text
            HStack{
                Text("Payment is £").font(.system(size: 16)).bold().padding(.top, 20)
            }
            
            
            Spacer()
            
            
        }.padding()
        
        
        //    }
        
        
    }
    //uncomment this function when ready
    
    //function for button
    func calculateMortgage() {
        guard lender.isEmpty,
              let newAmount = Double(amount),
              let interestPercent = Double(interest),
              let periodYears = Int(period),
        newAmount > 0, interestPercent > 0, periodYears > 0 else{
            statusMessage = "One or more of the field is empty or has zero"
            isFieldEmpty = true
            return
        }
        
        let principal = max(0,newAmount)
        let annualRate = max(0,interestPercent) / 100.0
        _ = annualRate / 12.0
        let n = Double(max(0,periodYears) * 12)
        //check values are not zero
        guard principal > 0, n > 0
        else {
            payment = 0
            hideKeyboard()
            return
        }
        /*
         
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
}
