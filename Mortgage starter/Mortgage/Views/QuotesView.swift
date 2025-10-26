//
//  ContentView.swift
//  Mortgage
//
//  Created by Philip Trwoga on 14/10/2024.
//

import SwiftUI
import SwiftData

struct QuotesView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var quotes: [MortgageModel]
    
    var body: some View {
        VStack{
            Text("Quotes List")
            //your List here
            //            List(quotes){quote in ...
            NavigationStack{
                Text("Quotes List")
                    .font(.title)
                    .padding()
                
                if quotes.isEmpty {
                    Text("No saved quotes yet.")
                        .foregroundStyle(Color(.gray))
                        .padding()
                }else {
                    List(quotes){ quote in
                            VStack{
                                // Lender
                                HStack{
                                        Label("", systemImage: "house.fill").frame(width: 20)
                                        Text("Lender ")
                                    Text(quote.lender).bold().font(.system(size: 18))
                                    }.frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.bottom, 2)
                                
                                // Loan Amount
                                HStack{
                                    Label("", systemImage: "banknote").frame(width: 20)
                                    Text("Loan Amount £\(quote.amount, specifier: "%.2f")")
                                    }.frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.bottom, 2)
                                // Interest
                                HStack{
                                    Label("", systemImage: "percent").frame(width: 20)
                                    Text("Interest \(quote.interest, specifier: "%.2f")%")
                                    }.frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.bottom, 2)
                                // Period
                                HStack{
                                    Label("", systemImage: "calendar").frame(width: 20)
                                    Text("Period \(quote.period) years")
                                    }.frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.bottom, 2)
                                // Payment
                                HStack{
                                    Label("", systemImage: "banknote").frame(width: 20)
                                    Text("Payment £\(quote.payment, specifier: "%.2f")")
                                    }.frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.bottom, 2)
                            }.padding()
                        
                    }

                }
            }
            
        }
    }
}

                #Preview {
                    QuotesView()
                }
        
    

