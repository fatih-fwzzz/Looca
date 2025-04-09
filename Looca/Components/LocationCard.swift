//
//  LocationCard.swift
//  Looca
//
//  Created by FWZ on 26/03/25.
//

import SwiftUI

struct LocationCard: View {
    var locationName: String
    var locationDistance: Int
    
    var body: some View {
        VStack {
            HStack{
                Image("pinpoint")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                VStack(alignment: .leading) {
                    Text(locationName)
                        .font(.headline)
                        .fontWeight(.bold)
                    Text("\(locationDistance) m away")
                        .font(.subheadline)
                }
                .padding(.top)
                Spacer()
            }
            .padding(.vertical, 5)
            .padding(.horizontal, 20)
        }
        .background(Color.white)
        .cornerRadius(12)
        
    }
}

#Preview {
    LocationCard(locationName: "GOP 9 Canteen", locationDistance: 1)
}
