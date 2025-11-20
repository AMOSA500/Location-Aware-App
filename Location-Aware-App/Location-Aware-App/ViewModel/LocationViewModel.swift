//
//  LocationViewModel.swift
//  Location-Aware-App
//
//  Created by Nafiu Amosa on 20/11/2025.
//

import Foundation
import CoreLocation
import SwiftData
import MapKit


@Observable
class LocationViewModel: NSObject, CLLocationManagerDelegate {
    // Dependencies
    private let locationManager: CLLocationManager
    private let modelContex: ModelContext
    
    // Published state
    var userlocation = CLLocationCoordinate2D?.self
    var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )
    
    var saveLocation: [Location] = []
    
    
    init(modelContex: ModelContext,
    ) {
        self.modelContex = modelContex
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        //loadSavedLocations()
    }
    
    
    
    
    
}
