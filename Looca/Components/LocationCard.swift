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
            HStack{
                Image("pinpoint")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                VStack(alignment: .leading) {
                    Text(locationName)
                        .font(.headline)
                        .fontWeight(.bold)
                    Text("\(locationDistance) km away")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
                Spacer()
            }
    }
}

#Preview {
    LocationCard(locationName: "GOP 9 Canteen", locationDistance: 1)
}
