//
//  LocationsView.swift
//  MapTutorialTemplate
//
//  Created by girish lukka on 18/10/2025.
//

//
//  LocationsView.swift
//  Displays saved or searched locations
//

import SwiftUI

struct LocationsView: View {
    @EnvironmentObject var locationViewModel: LocationViewModel

    var body: some View {
        NavigationStack {
            //  write your code to list saved locations
            // hint: use List(locationViewModel.locations)
            Text("Saved Locations will appear here.")
                .foregroundColor(.secondary)
                .navigationTitle("Saved Locations")
        }
    }
}

#Preview {
    let previewVM = LocationViewModel()
    LocationsView().environmentObject(previewVM)
}
