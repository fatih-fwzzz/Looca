//
//  LocationListView.swift
//  Looca
//
//  Created by FWZ on 04/04/25.
//

import SwiftUI

struct LocationListView: View {
    @Binding var showLocationListSheet: Bool
    @Binding var showCanteenInfoSheet: Bool
    @Binding var selectedDetent: PresentationDetent
    @Binding var selectedCanteenLocation: Int
    
    // MARK: -- ini sama kayak binding
    @ObservedObject var selectedPage: SelectedPage
    
    let canteens: [Canteen]
    
    var body: some View {
            VStack(spacing: 10) {
                // Fixed Header
                Text("GOP Location")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                    .padding(.top, 50)
                    .padding(.bottom, 20)
                    .background(Color("BackgroundColor")) // to keep background consistent

                // Scrollable content
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(canteens) { canteen in
                            Button {
                                selectedCanteenLocation = canteen.id
                                selectedPage.selectedPage = canteen.id
                                
                                showLocationListSheet = false
                                showCanteenInfoSheet = true
                            } label: {
                                LocationCard(locationName: canteen.name, locationDistance: Int(canteen.distanceInMeters))
                                    .padding(.horizontal)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.bottom, 20)
                }
            }
            .background(Color("BackgroundColor"))
            .foregroundColor(Color("MainColor"))
        }
}

#Preview {
    LocationListView(showLocationListSheet: .constant(true), showCanteenInfoSheet: .constant(false), selectedDetent: .constant(.large), selectedCanteenLocation: .constant(1), selectedPage: SelectedPage(),
                     canteens: [
                        Canteen(id: 1, name: "GOP 1 Canteen", description: "", latitude: 0.0, longitude: 0.0, image: "", openHours: "", estimationInMin: 0, distanceInMeters: 500, atmosphere: "", bestDish: "", priceRange: "", frequency: "", tenants: [], directions: []),
                        Canteen(id: 2, name: "GOP 6 Canteen", description: "", latitude: 0.0, longitude: 0.0, image: "", openHours: "", estimationInMin: 0, distanceInMeters: 500, atmosphere: "", bestDish: "", priceRange: "", frequency: "", tenants: [], directions: []),
                        Canteen(id: 3, name: "GOP 9 Canteen", description: "", latitude: 0.0, longitude: 0.0, image: "", openHours: "", estimationInMin: 0, distanceInMeters: 500, atmosphere: "", bestDish: "", priceRange: "", frequency: "", tenants: [], directions: [])
                     ]
    )
}
