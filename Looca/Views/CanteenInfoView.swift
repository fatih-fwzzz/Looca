//
//  CanteenInfoView.swift
//  Looca
//
//  Created by FWZ on 07/04/25.
//

import SwiftUI

struct CanteenInfoView: View {
    @State private var showAll: Bool = true
    
    @Binding var path: [Int]
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

                        Text("Located in the basement of Monash University’s Building")
                            .font(.subheadline)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                            .frame(maxWidth: 250, alignment: .leading)
                        
                        // Info Cards
                        CanteenInfoCard(
                            openHours: selectedCanteen.openHours,
                            estimate: selectedCanteen.estimationInMin,
                            distance: Int(selectedCanteen.distanceInKm)
                        )
                        .padding(.top)
                        
                        AdditionalInfoCard()
                        
                        Text("Top Tenants")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(selectedCanteen.tenants) { tenant in
                                    Button {
                                        path.append(selectedCanteenLocation)
                                        showCanteenInfoSheet.toggle()
                                    } label: {
                                        TenantCard(imageName: "restaurant", tenantName: tenant.name)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                            .padding(.leading)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal)
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
            .background(Color.white)
        }
    }
}

#Preview {
    CanteenInfoView(path: .constant([]),
                    showLocationListSheet: .constant(false), showCanteenInfoSheet: .constant(true),
                    showStepNavigationView: .constant(false),
                    selectedDetent: .constant(.fraction(0.5)), selectedCanteenLocation: .constant(1),
                    canteens: [Canteen(id: 1, name: "GOP 9 Canteen", latitude: 10, longitude: 35, image: "restaurants2", openHours: "17.00-23.00", estimationInMin: 10, distanceInKm: 10.0, tenants: [Tenant(id: 1, name: "t1", description: "asdf", image: "placeholder", priceMin: 10, priceMax: 100, menus: [Menu(id: 1, name: "asdf", description: "asdfg", image: "sadf", price: 14, bestSeller: true)]), Tenant(id: 2, name: "t2", description: "asdf", image: "placeholder", priceMin: 10, priceMax: 100, menus: [Menu(id: 1, name: "asdf", description: "asdfg", image: "sadf", price: 14, bestSeller: true)]), Tenant(id: 3, name: "t3", description: "asdf", image: "placeholder", priceMin: 10, priceMax: 100, menus: [Menu(id: 1, name: "asdf", description: "asdfg", image: "sadf", price: 14, bestSeller: true)])], directions: [Direction(id: 1, description: "sadg", afterMeters: 10, image: "restaurant")])]
                )
}
