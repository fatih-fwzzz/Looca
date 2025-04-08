//
//  DecodedTestView.swift
//  Looca
//
//  Created by FWZ on 08/04/25.
//

import SwiftUI

struct DecodedTestView: View {
    @StateObject private var viewModel = CanteenViewModel()  // ViewModel for fetching canteens
    
    var body: some View {
        NavigationView {
            List(viewModel.canteens) { canteen in
                VStack(alignment: .leading) {
                    Text(canteen.name)
                        .font(.headline)
                    Text("Open: \(canteen.openHours)")
                        .font(.subheadline)
                    Text("Distance: \(canteen.distanceInKm) km")
                        .font(.subheadline)
                    
//                    // Navigation to tenants list for this canteen
//                    NavigationLink(destination: TenantsView(canteen: canteen)) {
//                        Text("View Tenants")
//                            .font(.body)
//                            .foregroundColor(.blue)
//                    }
//                    .padding()
//                    
//                    // Button to navigate to directions
//                    NavigationLink(destination: DirectionsView(canteen: canteen)) {
//                        Text("Start Navigation")
//                            .font(.body)
//                            .foregroundColor(.green)
//                    }
//                    .padding()
                }
                .padding()
            }
            .onAppear {
                viewModel.fetchCanteens()  // Fetch canteen data on appearance
            }
            .navigationTitle("Canteens")
        }
    }
}

#Preview {
    DecodedTestView()
}
