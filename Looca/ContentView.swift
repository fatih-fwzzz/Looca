//
//  ContentView.swift
//  Looca
//
//  Created by FWZ on 25/03/25.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static let gopNineCanteen = CLLocationCoordinate2D(latitude: -6.30243, longitude: 106.65225)
}

struct ContentView: View {
    //    @State private var sheetDetail: InventoryItem?
    //    @State private var showSettings = false
    //    @State private var settingsDetent = PresentationDetent.medium
    @State private var showSheet = true  // Show sheet on startup
    @State private var showNextView = false
    @State private var showDirections = true
    @State private var selectedDetent: PresentationDetent = .fraction(0.8)  // Default detent
    
    var body: some View {
        ZStack{
            Map{
                Marker("GOP 9 Canteen", coordinate: .gopNineCanteen)
            }
            .ignoresSafeArea()
        }
        .sheet(isPresented: $showDirections) {
            NavigationStack{
                settingsView
                
            }
            .presentationDetents([.fraction(0.5), .medium, .large], selection: $selectedDetent)
            .presentationDragIndicator(.visible)
            .presentationBackgroundInteraction(.enabled)
        }
        
    }
    
    var settingsView: some View {
        
        ZStack(alignment: .top) {
            Color.white.ignoresSafeArea()
            VStack {
                VStack{
                    Text("GOP Location")
                        .font(.largeTitle)
                        .padding()
                }
                VStack(alignment: .leading){
                    LocationCard(showDistance: $showNextView, locationName: "GOP 9 Canteen", locationDistance: 2)
                    LocationCard(showDistance: $showNextView, locationName: "GOP 6 Canteen", locationDistance: 4)
                    LocationCard(showDistance: $showNextView, locationName: "GOP 1 Canteen", locationDistance: 1)
                }
            }
            .sheet(isPresented: $showNextView){
                nextView
                    .presentationDetents([.fraction(0.5), .medium, .large], selection: $selectedDetent)
                    .presentationDragIndicator(.visible)
                    .presentationBackgroundInteraction(.enabled)
            }
        }
    }
    
    var nextView: some View {
        Text("This is nextView")
    }
    
}

#Preview {
    ContentView()
}
