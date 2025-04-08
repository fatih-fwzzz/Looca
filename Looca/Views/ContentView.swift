//
//  ContentView.swift
//  Looca
//
//  Created by FWZ on 25/03/25.
//

import SwiftUI
import MapKit
import Foundation


// MARK: -- Class buat nyimpen filenya
class SelectedPage: ObservableObject {
    // pake published biar data bisa di edit di file manapun
    @Published var selectedPage: Int = 0
}

extension CLLocationCoordinate2D {
    static let gopNineCanteen = CLLocationCoordinate2D(latitude: -6.30243, longitude: 106.65225)
}

struct ContentView: View {
    @StateObject private var viewModel = CanteenViewModel()
    
    @State private var path: [Int] = []
    
    @State private var showLocationListSheet = true
    @State private var showCanteenInfoSheet = false
    @State private var showNavSheet = false
    @State private var showAll = false
    
    @State private var selectedDetent: PresentationDetent = .fraction(0.5)
    
    @State private var selectedCanteenLocation: Int = 0// default selected canteen
    
    // MARK: -- Disini initiate si observable object-nya
    @StateObject private var selectedPage: SelectedPage = .init()
    
    var body: some View {
        NavigationStack(path: $path){
            Map{
                Marker("GOP 9 Canteen", coordinate: .gopNineCanteen)
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
            .navigationDestination(for: Int.self) { num in
                // it should be a view that consist of the menu's list of selected canteen
                Text("GOP \(num) Canteen information") // Show detail page after dismissing the sheet
                    .onDisappear {
                        if path.isEmpty {
                            showCanteenInfoSheet = true
                        }
                    }
            }
            .onChange(of: path){_, newPath in
                if newPath.isEmpty {
                    showCanteenInfoSheet = true
                }
            }
        }
        
        // first sheet
        .sheet(isPresented: $showLocationListSheet) {
            LocationListView(showLocationListSheet: $showLocationListSheet, showCanteenInfoSheet: $showCanteenInfoSheet, path: $path, selectedDetent: $selectedDetent, selectedCanteenLocation: $selectedCanteenLocation, selectedPage: selectedPage, canteens: viewModel.canteens)
                .presentationDetents([.fraction(0.5), .medium, .large], selection: $selectedDetent)
                .presentationDragIndicator(.visible)
                .presentationBackgroundInteraction(.enabled)
        }
        
        // second sheet
        .sheet(isPresented: $showCanteenInfoSheet){
            // this is the detail of the selected canteen location
            CanteenInfoView(path: $path, showLocationListSheet: $showLocationListSheet, showCanteenInfoSheet: $showCanteenInfoSheet, showNavSheet: $showNavSheet, selectedDetent: $selectedDetent, selectedCanteenLocation: $selectedCanteenLocation, canteens: viewModel.canteens)
                .presentationDetents([.fraction(0.5), .medium, .large], selection: $selectedDetent)
                .presentationDragIndicator(.visible)
        }
        
        // third sheet
        // Third sheet
        .sheet(isPresented: $showNavSheet) {
            // Debugging the values
            //            print("selectedCanteenLocation: \(selectedCanteenLocation)")
            //            print("viewModel.canteens: \(viewModel.canteens)")
            
            if let selectedCanteen = viewModel.canteens.first(where: { $0.id == selectedPage.selectedPage }) {
                NavView(showNavSheet: $showNavSheet, showCanteenInfoSheet: $showCanteenInfoSheet, selectedPage: selectedPage, canteen: selectedCanteen)
                    .presentationDetents([.fraction(0.5), .medium, .large], selection: $selectedDetent)
                    .presentationDragIndicator(.visible)
            } else {
                VStack {
                    Text("Nothing")
                    Text("selectedCanteenLocation: \(selectedCanteenLocation)")
                    Text("viewModel.canteens: \(viewModel.canteens)")
                }
                .presentationDetents([.fraction(0.5), .medium, .large], selection: $selectedDetent)
                .presentationDragIndicator(.visible)
            }
        }
        
        
        
    }
}



#Preview {
    ContentView()
}
