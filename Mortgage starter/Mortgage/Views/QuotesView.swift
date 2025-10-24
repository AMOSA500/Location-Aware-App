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
                List(quotes){ quote in
                    Form{
                        VStack{
                            HStack{
                                    Label("", systemImage: "house.fill").frame(width: 20)
                                    Text("Lender ")
                                Text(quote.lender).bold().font(.system(size: 18))
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
        
    

