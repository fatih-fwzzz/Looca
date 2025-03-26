//
//  LocationCard.swift
//  Looca
//
//  Created by FWZ on 26/03/25.
//

import SwiftUI

struct LocationCard: View {
    @Binding var showDistance: Bool
    var locationName: String
    var locationDistance: Int
    
    var body: some View {
        Button(action: {showDistance.toggle()}) {
            HStack{
                Image(systemName: "mappin.circle")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .padding(10)
                VStack(alignment: .leading) {
                    Text(locationName)
                        .font(.headline)
                        .fontWeight(.bold)
                    Text("\(locationDistance) km away")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }.buttonStyle(PlainButtonStyle())   
    }
}

#Preview {
    LocationCard(showDistance: .constant(false), locationName: "GOP 9 Canteen", locationDistance: 1)
}
