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
    @Binding var path: [Int]
    @Binding var selectedDetent: PresentationDetent
    @Binding var selectedCanteenLocation: Int
    
    // MARK: -- ini sama kayak binding
    @ObservedObject var selectedPage: SelectedPage
    
    let canteens: [Canteen]
    
    var body: some View {
        NavigationStack {
            List(canteens) { canteen in
                Button {
                    selectedCanteenLocation = canteen.id
                    selectedPage.selectedPage = canteen.id
                    
                    showLocationListSheet = false
                    showCanteenInfoSheet = true
                }
                label: {
                    LocationCard(locationName: canteen.name, locationDistance: Int(canteen.distanceInKm))
                }
                .buttonStyle(PlainButtonStyle())
            }
            .navigationTitle("GOP Location")
            .navigationBarTitleDisplayMode(.large)
        }
        
    }
}

//#Preview {
//    LocationListView(path: .constant([]), showingSheetFirst: .constant(true))
//}
