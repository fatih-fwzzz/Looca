//
//  Direction.swift
//  Looca
//
//  Created by FWZ on 08/04/25.
//

import Foundation

struct Direction: Identifiable, Codable {
    var id: Int
    var description: String
    var afterMeters: Int
    var image: String
    var latitude: Double
    var longitude: Double
}
