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
    @State private var path: [Int] = []
    
    @State private var showLocationListSheet = true
    @State private var showCanteenInfoSheet = false
    @State private var showAll = false
    
    @State private var selectedDetent: PresentationDetent = .fraction(0.5)
    
    @State private var selectedCanteenLocation: Int = 9 // default selected canteen
    
    var body: some View {
        NavigationStack(path: $path){
            Map{
                Marker("GOP 9 Canteen", coordinate: .gopNineCanteen)
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
            .navigationDestination(for: Int.self) { num in
//                nextView
                Text("GOP \(num) Canteen information")// Show detail page after dismissing the sheet
            }
            .onChange(of: path){_, newPath in
                if newPath.isEmpty {
                    showCanteenInfoSheet = true
                }
            }
        }
        
        // first sheet
        .sheet(isPresented: $showLocationListSheet) {
            LocationListView(showLocationListSheet: $showLocationListSheet, showCanteenInfoSheet: $showCanteenInfoSheet, path: $path, selectedDetent: $selectedDetent, selectedCanteenLocation: $selectedCanteenLocation)
                .presentationDetents([.fraction(0.5), .medium, .large], selection: $selectedDetent)
                .presentationDragIndicator(.visible)
                .presentationBackgroundInteraction(.enabled)
        }
        
        // second sheet
        .sheet(isPresented: $showCanteenInfoSheet){
            CanteenInfoView(path: $path, showLocationListSheet: $showLocationListSheet, showCanteenInfoSheet: $showCanteenInfoSheet, selectedDetent: $selectedDetent, selectedCanteenLocation: $selectedCanteenLocation)
                .presentationDetents([.fraction(0.5), .medium, .large], selection: $selectedDetent)
                .presentationDragIndicator(.visible)
        }
        
    }
}

struct CanteenInfoView: View {
    @State private var showAll: Bool = true
    
    @Binding var path: [Int]
    @Binding var showLocationListSheet: Bool
    @Binding var showCanteenInfoSheet: Bool
    @Binding var selectedDetent: PresentationDetent
    @Binding var selectedCanteenLocation: Int
    
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea()
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("GOP \(selectedCanteenLocation) Canteen")
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
                        Text("Canteen of GOP 9")
                        
                    }
                    Spacer()
                    Button(action: {
                        // .toggle() is just the same like a flag to turn it into true / false
//                        showCanteenInfoSheet.toggle()
//                        showLocationListSheet.toggle()
                        
                        showCanteenInfoSheet = false
                        showLocationListSheet = true
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title)
                            .foregroundColor(.gray)
                    }
                }.padding()
                CanteenInfoCard(openHours: "07.00 - 15.00", estimate: 5, distance: 1)
                Text("Tenant List")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading) // Aligns text to the left
                    .padding(.leading)
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        Button {
                            path.append(selectedCanteenLocation)
                            showCanteenInfoSheet.toggle()
                        }
                        label: {
                            TenantCard(imageName: "restaurant", tenantName: "Djempol Mama")
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        Button(action: {showAll.toggle()}){
                            // Overlay Text
                            Text("Show All")
                            
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipped()
                                .background(Color.gray.opacity(0.3))
                                .cornerRadius(16)
                                .foregroundColor(.black)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                            
                        }
                    }
                    .padding(.leading)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                // Button Fixed at Bottom
                VStack {
                    NavigateButton(showDirections: .constant(false))
                        .padding()
                }
                .frame(maxWidth: .infinity)
                .background(Color.white)
                
            }.ignoresSafeArea(.keyboard)
            
        }
    }
}

#Preview {
    ContentView()
}
