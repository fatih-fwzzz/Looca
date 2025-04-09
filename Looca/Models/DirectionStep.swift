//
//  DirectionStep.swift
//  Looca
//
//  Created by Patricia Putri Art Syani on 09/04/25.
//

import SwiftUI
import MapKit
import CoreLocation

struct DirectionStep: Identifiable {
    let id = UUID()
    let description: String
    let afterMeters: String
    let image: String
    let arrow: String
    let coordinate: CLLocationCoordinate2D
}
