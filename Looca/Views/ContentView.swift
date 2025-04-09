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
    static let gopOneCanteen = CLLocationCoordinate2D(latitude: -6.301458549442683, longitude: 106.65057935323979)
    static let gopNineCanteen = CLLocationCoordinate2D(latitude: -6.30243, longitude: 106.65225)
    static let gopSixCanteen = CLLocationCoordinate2D(latitude: -6.30279, longitude: 106.65321)
}

struct ContentView: View {
    @StateObject private var viewModel = CanteenViewModel()
    
    @State private var showLocationListSheet = true
    @State private var showCanteenInfoSheet = false
    @State private var showStepNavigationView = false
    @State private var showCompletionScreen = false
    
    @State private var selectedDetent: PresentationDetent = .fraction(0.6)
    
    @State private var selectedCanteenLocation: Int = 0// default selected canteen
    
    @State private var stepCoordinate = CLLocationCoordinate2D(
           latitude: CLLocationCoordinate2D.gopNineCanteen.latitude,
           longitude: CLLocationCoordinate2D.gopNineCanteen.longitude
       )
    
    // MARK: -- Disini initiate si observable object-nya
    @StateObject private var selectedPage: SelectedPage = .init()
    
    var body: some View {
        ZStack {
            Map(initialPosition: .region(
                MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: CLLocationCoordinate2D.gopNineCanteen.latitude - 0.002,
                                                   longitude: CLLocationCoordinate2D.gopNineCanteen.longitude),
                    span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
                )
            )){
                Annotation("GOP 9 Canteen", coordinate: .gopNineCanteen){
                    Image("pinpoint")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)

                }
                Annotation("GOP 1 Canteen", coordinate: .gopOneCanteen){
                    Image("pinpoint")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                }
                Annotation("GOP 6 Canteen", coordinate: .gopSixCanteen){
                    Image("pinpoint")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                }
            }
            .ignoresSafeArea(edges: .all)
            .navigationBarHidden(true)
            
            if showStepNavigationView {
                if let selectedCanteen = viewModel.canteens.first(where: { $0.id == selectedPage.selectedPage }) {
                    StepNavigationView(showCompletionScreen: $showCompletionScreen, showStepNavigationView: $showStepNavigationView, canteen: selectedCanteen)
                        .transition(.move(edge: .bottom))
                        .zIndex(1)
                } else {
                    Text("Selected Canteen: \(selectedPage.selectedPage)")
                } 
            }
        }
        
        .fullScreenCover(isPresented: $showCompletionScreen) {
            if let selectedCanteen = viewModel.canteens.first(where: { $0.id == selectedPage.selectedPage }) {
                CompletionScreenView(showBackPage: $showLocationListSheet, gopName: selectedCanteen.name)
            }
        }
        
        // first sheet
        .sheet(isPresented: $showLocationListSheet) {
            LocationListView(showLocationListSheet: $showLocationListSheet, showCanteenInfoSheet: $showCanteenInfoSheet, selectedDetent: $selectedDetent, selectedCanteenLocation: $selectedCanteenLocation, selectedPage: selectedPage, canteens: viewModel.canteens)
                .presentationDetents([.fraction(0.1), .fraction(0.6)], selection: $selectedDetent)
                .presentationDragIndicator(.visible)
                .presentationBackgroundInteraction(.enabled)
                .interactiveDismissDisabled(true)
        }
        
        // second sheet
        .sheet(isPresented: $showCanteenInfoSheet){
            // this is the detail of the selected canteen location
            CanteenInfoView(showLocationListSheet: $showLocationListSheet, showCanteenInfoSheet: $showCanteenInfoSheet, showStepNavigationView: $showStepNavigationView, selectedDetent: $selectedDetent, selectedCanteenLocation: $selectedCanteenLocation, canteens: viewModel.canteens)
                .presentationDetents([ .fraction(0.1), .fraction(0.6), .fraction(0.9)], selection: $selectedDetent)
                .presentationDragIndicator(.visible)
                .interactiveDismissDisabled(true)
        }
    }
}



#Preview {
    ContentView()
}
