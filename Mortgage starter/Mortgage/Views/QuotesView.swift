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
            
        }
    }
}

                #Preview {
                    QuotesView()
                }
        
    

