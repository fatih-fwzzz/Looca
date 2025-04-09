//
//  CanteenInfoView.swift
//  Looca
//
//  Created by FWZ on 07/04/25.
//

import SwiftUI

struct CanteenInfoView: View {
    @State private var showAll: Bool = true
    
    @Binding var showLocationListSheet: Bool
    @Binding var showCanteenInfoSheet: Bool
    @Binding var showStepNavigationView: Bool
    @Binding var selectedDetent: PresentationDetent
    @Binding var selectedCanteenLocation: Int
    
    let canteens: [Canteen]
    
    var body: some View {
        if let selectedCanteen = canteens.first(where: { $0.id == selectedCanteenLocation }) {
            VStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        // Header
                        HStack {
                            Text(selectedCanteen.name)
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Button(action: {
                                showCanteenInfoSheet = false
                                showLocationListSheet = true
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .font(.title2)
                                    .fontWeight(.medium)
                                    .foregroundColor(Color("MainColor"))
                            }
                        }
                        

                        Text(selectedCanteen.description)
                            .font(.subheadline)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                            .frame(maxWidth: 250, alignment: .leading)
                        
                        // Info Cards
                        VStack {
                            CanteenInfoCard(
                                openHours: selectedCanteen.openHours,
                                estimate: selectedCanteen.estimationInMin,
                                distance: Int(selectedCanteen.distanceInMeters)
                            )
                            
                            AdditionalInfoCard(bestDish: selectedCanteen.bestDish, atmosphere: selectedCanteen.atmosphere, priceRange: selectedCanteen.priceRange, frequency: selectedCanteen.frequency)
                        }
                        .padding([.top, .bottom])
                        
                        
                        
                        Text("Top Tenants")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(selectedCanteen.tenants) { tenant in
                                    TenantCard(imageName: "restaurant", tenantName: tenant.name, tenantDescription: tenant.description)
                                }
                            }
                            .padding(.leading)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 30)
                }
                
                // Button fixed at bottom
                VStack {
                    Button {
                        showCanteenInfoSheet.toggle()
                        showStepNavigationView.toggle()
                    } label: {
                        NavigateButton()
                            .padding()
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .ignoresSafeArea(.keyboard)
            .foregroundColor(Color("MainColor"))
            .background(Color("BackgroundColor"))
            
        }
    }
}

#Preview {
    CanteenInfoView(showLocationListSheet: .constant(true), showCanteenInfoSheet: .constant(false), showStepNavigationView: .constant(false), selectedDetent: .constant(.medium), selectedCanteenLocation: .constant(1), canteens: [
        Canteen(
            id: 1,
            name: "asd",
            description: "asdfghjkl",
            latitude: -6.301458549442683,
            longitude: 106.65057935323979,
            image: "restaurant",
            openHours: "17.00 - 20.00",
            estimationInMin: 10,
            distanceInMeters: 300,
            atmosphere: "Popular During Break Time",
            bestDish: "Ayam Goyeng Kasturi",
            priceRange: "IDR 10.000 - IDR 20.000",
            frequency: "Moderately Busy",
                tenants: [
                    Tenant(id: 1, name: "KFC", description: "Kentucky Fried Chicken", image: "restaurant"),
                    Tenant(id: 1, name: "Burger King", description: "The burgers are so big!", image: "restauran2"),
                ], directions: [])
    ])
}
