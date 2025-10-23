//
//  MapTutorialTemplateApp.swift
//  MapTutorialTemplate
//
//  Created by girish lukka on 18/10/2025.
//

import SwiftUI

@main
struct MapTutorialTemplateApp: App {
    // Shared ViewModel for all views
    @StateObject private var locationViewModel = LocationViewModel()

    var body: some Scene {
        WindowGroup {
            // Connect your main content view here
            ContentView()
                .environmentObject(locationViewModel)
        }
    }
}
