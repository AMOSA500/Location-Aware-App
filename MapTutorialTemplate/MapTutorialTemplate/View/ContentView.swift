//
//  ContentView.swift
//  MapTutorialTemplate
//
//  Created by girish lukka on 18/10/2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var locationViewModel: LocationViewModel

    var body: some View {
        TabView {
            //  Map Tab
            MapView()
                .tabItem {
                    Label("Map", systemImage: "map")
                }

            //  POIs Tab
            POIsView()
                .tabItem {
                    Label("POIs", systemImage: "mappin.and.ellipse")
                }

            //  Saved Locations Tab
            LocationsView()
                .tabItem {
                    Label("Saved", systemImage: "bookmark")
                }
        }
        .tint(.blue)
    }
}

#Preview {
    let previewVM = LocationViewModel()
    ContentView().environmentObject(previewVM)
}
