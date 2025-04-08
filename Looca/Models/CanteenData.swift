//
//  CanteenData.swift
//  Looca
//
//  Created by FWZ on 08/04/25.
//

import Foundation

class CanteenData {
    static func fetchCanteens(completion: @escaping ([Canteen]) -> Void) {
        if let url = Bundle.main.url(forResource: "looca", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decodedData = try JSONDecoder().decode([Canteen].self, from: data)
                completion(decodedData)
            } catch {
                print("Error decoding data: \(error)")
                completion([])
            }
        }
    }
}
