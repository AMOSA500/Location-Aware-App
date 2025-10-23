//
//  POIsView.swift
//  MapTutorialTemplate
//
//  Created by girish lukka on 18/10/2025.
//

//
//  POIsView.swift
//  List of nearby points of interest
//

import SwiftUI

struct POIsView: View {
    @EnvironmentObject var locationViewModel: LocationViewModel

    var body: some View {
        NavigationStack {
            //  write your code to list POIs
            // hint: use a List and ForEach(locationViewModel.pois)
            Text("Nearby Points of Interest will appear here.")
                .foregroundColor(.secondary)
                .navigationTitle("POIs near \(locationViewModel.locationName)")
        }
    }
}

#Preview {
    let previewVM = LocationViewModel()
    POIsView().environmentObject(previewVM)
}
