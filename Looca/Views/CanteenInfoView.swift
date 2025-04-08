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
    @Binding var showNavSheet: Bool
    
    @Binding var selectedDetent: PresentationDetent
    @Binding var selectedCanteenLocation: Int
    
    let canteens: [Canteen]
    
    var body: some View {
        if let selectedCanteen = canteens.first(where: { $0.id == selectedCanteenLocation }){
            ZStack{
                Color.white.ignoresSafeArea()
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(selectedCanteen.name)
                                .font(.title)
                                .fontWeight(.semibold)
                                .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
                            Text("Delicious foods are here")
                            
                        }
                        Spacer()
                        Button(action: {
                            showCanteenInfoSheet = false
                            showLocationListSheet = true
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .font(.title)
                                .foregroundColor(.gray)
                        }
                    }.padding()
                    
                    // find the data based on the id
                    
                    CanteenInfoCard(openHours: selectedCanteen.openHours, estimate: selectedCanteen.estimationInMin, distance: Int(selectedCanteen.distanceInKm))
                    
                    Text("Tenant List")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(selectedCanteen.tenants) { tenant in
                                Button {
                                    path.append(selectedCanteenLocation)
                                    showCanteenInfoSheet.toggle()
                                }
                                label: {
                                    TenantCard(imageName: "restaurant", tenantName: tenant.name)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                            
                            Button(action: { showAll.toggle() }) {
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
                        Button {
                            showCanteenInfoSheet.toggle()
                            showNavSheet.toggle()
                        }
                        label:{
                            NavigateButton()
                                .padding()
                        }
                        
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    
                }.ignoresSafeArea(.keyboard)
                
            }
        }
    }
}

#Preview {
    CanteenInfoView(path: .constant([]),
                    showLocationListSheet: .constant(false), showCanteenInfoSheet: .constant(true),
                    showNavSheet: .constant(false),
                    selectedDetent: .constant(.fraction(0.5)), selectedCanteenLocation: .constant(1),
                    canteens: [Canteen(id: 1, name: "asdff", latitude: 10, longitude: 35, image: "restaurants2", openHours: "17.00-23.00", estimationInMin: 10, distanceInKm: 10.0, tenants: [Tenant(id: 2, name: "t1", description: "asdf", image: "placeholder", priceMin: 10, priceMax: 100, menus: [Menu(id: 1, name: "asdf", description: "asdfg", image: "sadf", price: 14, bestSeller: true)])], directions: [Direction(id: 1, description: "sadg", afterMeters: 10, image: "restaurant")])]
                )
}
