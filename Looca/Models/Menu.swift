//
//  Menu.swift
//  Looca
//
//  Created by FWZ on 08/04/25.
//

import Foundation

struct Menu: Identifiable, Codable {
    var id: Int
    var name: String
    var description: String
    var image: String
    var price: Int
    var bestSeller: Bool
}
