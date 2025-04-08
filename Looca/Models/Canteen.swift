//
//  Canteen.swift
//  Looca
//
//  Created by FWZ on 08/04/25.
//

import Foundation

struct Canteen: Identifiable, Codable {
    var id: Int
    var name: String
    var latitude: Double
    var longitude: Double
    var image: String
    var openHours: String
    var estimationInMin: Int
    var distanceInKm: Double
    var tenants: [Tenant]
    var directions: [Direction]
}
