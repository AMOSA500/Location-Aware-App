//
//  Location.swift
//  Location-Aware-App
//
//  Created by Nafiu Amosa on 20/11/2025.
//

import Foundation
import SwiftData
import CoreLocation

@Model
final class Location: Identifiable {
    var id: UUID = UUID()
    var name: String?
    var latitude: Double = 0.0
    var longitude: Double
    var timestamp: Date
    
    init(
        id: UUID,
        name: String? = "Unknown",
        latitude: Double,
        longitude: Double,
        timestamp: Date
    ) {
        self.id = id
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.timestamp = timestamp
    }
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
