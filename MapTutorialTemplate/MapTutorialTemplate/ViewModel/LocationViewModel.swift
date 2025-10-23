//
//  LocationViewModel.swift
//  MapTutorialTemplate
//
//  Created by girish lukka on 18/10/2025.
//

//
//  LocationViewModel.swift
//  ViewModel controlling app logic
//

import Foundation
import SwiftUI
@preconcurrency import MapKit
@preconcurrency import CoreLocation

@MainActor
class LocationViewModel: ObservableObject {
    @Published var locationName: String = ""
    @Published var locationCoordinate2D: CLLocationCoordinate2D?
    @Published var locationMapRegion: MKCoordinateRegion = MKCoordinateRegion()
    @Published var errorMessage: String?
    @Published var locations: [LocationModel] = []
    @Published var pois: [POI] = []

    init() {
        //  write your code to reset to a default location (e.g., London)
        // hint: use CLLocationCoordinate2D and MKCoordinateRegion
    }

    // MARK: - Fetch Location Data
    func fetchLocationData(locationName: String) async {
        //  write your code to perform geocoding with CLGeocoder
        // 1. Use try await geocodeAddressString
        // 2. Extract coordinate and update locationMapRegion
        // 3. Handle error with handleError(_:)
    }

    // MARK: - Fetch Points of Interest
    func getPOIS() async {
        //  write your code to perform MKLocalSearch for “tourist places”
        // 1. Create a MKLocalSearch.Request()
        // 2. Await search.start()
        // 3. Convert mapItems to POI objects
    }

    // MARK: - Error Handling
    private func handleError(_ message: String) {
        //  write your code to store the message and reset to default region
    }
}

