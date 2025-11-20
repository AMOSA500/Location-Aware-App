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
//    @State private var mortgageModelArray: [MortgageModel] = []
    @AppStorage("lender") private var lender = "None"
    @AppStorage("amount") private var amount = "300000"
    @AppStorage("interest") private var interest = "4"
    @AppStorage("period") private var period = "25"
    @State var isFieldEmpty = false
    @State var statusMessage = ""
    @State var payment: Double = 0.0
    let ukTopBanks: [String] = [
        "HSBC",
        "Barclays",
        "Lloyds Bank",
        "NatWest Group",
        "Standard Chartered",
        "Santander UK",
        "Nationwide Building Society",
        "Virgin Money UK",
        "TSB Bank",
        "Metro Bank"
    ]

    
    var body: some View {
        
        
        VStack{
            headerView()
            Divider()
            HStack(alignment: .center, spacing: 20){
                Label("Lender", systemImage: "house.fill").frame(width: 150, alignment: .leading)
                Picker("Select a lender", selection: $lender){
                    ForEach(ukTopBanks, id: \.self){ bank in
                        Text(bank).tag(bank)
                    }
                }.pickerStyle(.menu)
                    .padding(.horizontal, 10)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .border(.black, width: 1)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .foregroundColor(Color.black)
                    
            }
            
//          InputView(value: $lender, label: "Lender", symbol: "house.fill", placeholder: "none", isNumberField: false)
            
            InputView(value: $amount, label: "Amount", symbol: "sterlingsign", placeholder: "300000", isNumberField: true)
            
            InputView(value: $interest, label: "Interest %", symbol: "percent", placeholder: "4", isNumberField: true)
            
            InputView(value: $period, label: "Period (years)", symbol: "calendar", placeholder: "25", isNumberField: true)
            
            
            Button{
                //Action
                calculateMortgage()
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
                Text("Payment is £\(payment, specifier: "%.2f")").font(.system(size: 16)).bold().padding(.top, 20)
            }
            
            
            Spacer()
            
            
        }.padding()
        
        
        //    }
        
        
    }
    //uncomment this function when ready
    
    @ViewBuilder
    func headerView() -> some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(Color.red)
                .rotationEffect(Angle(degrees: -15))
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(Color.blue)
                .rotationEffect(Angle(degrees: 15))
            VStack{
                Image(systemName: "lirasign.bank.building.fill").font(.system(size: 50)).foregroundColor(.white).padding(.top,10)
                Text("Mortgage")
                    .font(.system(size: 52))
                    .bold()
                    .foregroundColor(.white)
                Text("Calculator").font(.system(size: 32))

            }
            
            
        }.frame(width: UIScreen.main.bounds.width * 3, height: 350)
            .offset(y: -110)
    }
    
    //function for button
    func calculateMortgage() {
        guard lender.lowercased() != "none",
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
        let monthlyRate = annualRate / 12.0
        let n = Double(max(0,periodYears) * 12)
        //check values are not zero
        guard principal > 0, n > 0
        else {
            payment = 0.0
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
        let newMortgage = MortgageModel(
            lender: lender,
            amount: newAmount,
            interest: interestPercent,
            period: periodYears,
            payment: payment
        );
        
        modelContext.insert(newMortgage)
        try? modelContext.save()
         hideKeyboard()
         }
         
        
        //uncomment this function when ready - call this function to hide the keyboard
        func hideKeyboard() {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    
    /* Save for later
     func saveToFile(){
        if let data = try? JSONEncoder().encode(mortgageModel){
            let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("mortgage.json")
            data.write(to: url)
        }
    }*/
        
    }
    
    #Preview {
        MainTabView()
    }



