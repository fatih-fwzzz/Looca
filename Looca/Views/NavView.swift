//
//  ContentView.swift
//  CobaLooca
//
//  Created by Patricia Putri Art Syani on 25/03/25.
//

import SwiftUI

struct NavView: View {
    @Binding var showNavSheet: Bool
    @Binding var showCanteenInfoSheet: Bool
    
    
    
    let canteen: Canteen  // Accept the selected canteen
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    // Check if directions exist and display them
                    if canteen.directions.isEmpty {
                        Text("No directions available")
                            .font(.headline)
                            .foregroundColor(.gray)
                    } else {
                        ForEach(canteen.directions) { direction in  // Use directions from the canteen
                            NavCard(direction: direction)  // Pass direction data to NavCard
                        }
                    }                }
                .padding()
            }
            .navigationBarTitle("Direction")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showNavSheet = false
                        showCanteenInfoSheet = true
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color.gray)
                            .font(.subheadline)
                    }
                }
            }
        }
    }
}


//#Preview {
//    NavView(showNavSheet: .constant(true), showCanteenInfoSheet: .constant(false))
//}
