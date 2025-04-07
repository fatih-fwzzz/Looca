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
    
    var body: some View {
        NavigationStack {
            List(1...10, id: \.self) { num in
                Button {
                    selectedCanteenLocation = num
                    
                    showLocationListSheet = false
                    showCanteenInfoSheet = true
                }
                label: {
                    LocationCard(locationName: "GOP \(num) Canteen", locationDistance: 3)
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
