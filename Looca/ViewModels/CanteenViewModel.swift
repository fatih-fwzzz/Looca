//
//  ViewModels.swift
//  Looca
//
//  Created by FWZ on 08/04/25.
//

import Foundation

class CanteenViewModel: ObservableObject {
    @Published var canteens: [Canteen] = []
    
    init() {
        fetchCanteens()
    }
    
    public func fetchCanteens() {
        CanteenData.fetchCanteens { [weak self] canteens in
            DispatchQueue.main.async {
                self?.canteens = canteens
                //                print("Decoded canteens direction: \(canteens)")
                
                // Print the directions for each canteen
                for canteen in canteens {
                    print("Directions for \(canteen.name):")
                    for direction in canteen.directions {
//                        print("- \(direction.description) after \(direction.afterMeters) meters")
                        print("Decoded directions: \(direction)")
                    }
                }
            }
        }
    }
}
