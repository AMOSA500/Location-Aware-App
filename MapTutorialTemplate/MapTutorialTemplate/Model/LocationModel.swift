//
//  LocationModel.swift
//  MapTutorialTemplate
//
//  Created by girish lukka on 18/10/2025.
//

//
//  LocationModel.swift
//  Basic data models
//

import Foundation

// Model for a saved or searched location
struct LocationModel: Identifiable, Codable {
    var id = UUID()
    var locationName: String
    var latitude: Double
    var longitude: Double
}

// Model for a nearby Point of Interest (POI)
struct POI: Identifiable, Codable {
    var id = UUID()
    var poiName: String
    var latitude: Double
    var longitude: Double
}

