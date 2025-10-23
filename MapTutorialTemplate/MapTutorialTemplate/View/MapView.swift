//
//  MapView.swift
//  MapTutorialTemplate
//
//  Created by girish lukka on 18/10/2025.
//

//
//  MapView.swift
//  Displays the map and handles searches
//

import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject var locationViewModel: LocationViewModel
    @State private var locationName: String = ""
    @State private var showingErrorAlert = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // --- Search Section ---
                Form {
                    Section("Search for a location") {
                        TextField("Enter location name", text: $locationName)
                            .onSubmit {
                                Task{
                                    do{
                                        let geocoder = CLGeocoder()
                                        let placemark = try await geocoder.geocodeAddressString(locationName)
                                        await locationViewModel.fetchLocationData(locationName: locationName)
                                        await locationViewModel.getPOIS()
                                    }catch{
                                        print("An error occurred during geocoding or data fetching: \(error.localizedDescription)")
                                    }
                                }
                                
                                //  call your async location fetch function here
                                // hint: use a Task and call fetchLocationData + getPOIS
                            }
                    }
                }
                .frame(height: 150)

                // --- Map Section ---
                //  Critical section: display map annotations
                Map(
                    coordinateRegion: $locationViewModel.locationMapRegion,
                    showsUserLocation: false,
                    annotationItems: locationViewModel.pois
                ) { poi in
                    MapAnnotation(
                        coordinate: CLLocationCoordinate2D(
                            latitude: poi.latitude,
                            longitude: poi.longitude
                        )
                    ) {
                        VStack {
                            Image(systemName: "mappin.circle.fill")
                                .resizable()
                                .foregroundColor(.red)
                                .frame(width: 30, height: 30)
                            Text(poi.poiName)
                                .font(.caption)
                        }
                    }
                }
                .ignoresSafeArea(edges: .bottom)
            }
            .navigationTitle("Map Search")
            .alert("Error", isPresented: $showingErrorAlert) {
                Button("OK", role: .cancel) { showingErrorAlert = false }
            } message: {
                Text(locationViewModel.errorMessage ?? "Unknown error")
            }
        }
    }
}

#Preview {
    let previewVM = LocationViewModel()
    MapView().environmentObject(previewVM)
}
