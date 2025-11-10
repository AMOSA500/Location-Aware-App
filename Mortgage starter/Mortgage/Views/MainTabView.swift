//
//  MainTabView.swift
//  Mortgage
//
//  Created by Philip Trwoga on 14/10/2024.
//

import SwiftUI


struct MainTabView: View {
    var body: some View {
        TabView {
            Group{
                MortgageMainView()
                    .tabItem{
                        Label("Mortgage", systemImage: "sterlingsign")
                    }
                QuotesView()
                    .tabItem{
                        Label("History", systemImage: "calendar")
                    }
            }
            //first view here
            //.tabItem...
            //second viewhere
            //.tabItem...
            
        }
    }
}

#Preview {
    MainTabView()
}
