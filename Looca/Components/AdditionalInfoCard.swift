//
//  AdditionalInfoCard.swift
//  Looca
//
//  Created by FWZ on 08/04/25.
//

import SwiftUI

struct AdditionalInfoCard: View {
    var bestDish: String
    var atmosphere: String
    var priceRange: String
    var frequency: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                HStack {
                    Image(systemName: "storefront.fill")
                        .frame(width: 28, alignment: .leading)
                    Text("Best Dish").fontWeight(.semibold)
                }
                Spacer()
                Text(bestDish)
                    .font(.subheadline)
                    .multilineTextAlignment(.trailing)
            }
            HStack {
                HStack {
                    Image(systemName: "chair.lounge.fill")
                        .frame(width: 28, alignment: .leading)
                    Text("Atmosphere").fontWeight(.semibold)
                }
                Spacer()
                Text(atmosphere)
                    .font(.subheadline)
                    .multilineTextAlignment(.trailing)
            }
            HStack {
                HStack {
                    Image(systemName: "dollarsign.circle.fill")
                        .frame(width: 28, alignment: .leading)
                    Text("Budget").fontWeight(.semibold)
                }
                Spacer()
                Text(priceRange)
                    .font(.subheadline)
                    .multilineTextAlignment(.trailing)
            }
            HStack {
                HStack {
                    Image(systemName: "person.2.fill")
                        .frame(width: 28, alignment: .leading)
                    Text("Frequency").fontWeight(.semibold)
                }
                Spacer()
                Text(frequency)
                    .font(.subheadline)
                    .multilineTextAlignment(.trailing)
            }
        }
        .padding()
    }
}

#Preview {
    AdditionalInfoCard(bestDish: "Nasi Goreng Kampung", atmosphere: "Traditional Warung Vibes", priceRange: "IDR 40.000 – 240.000", frequency: "Gets Busy at Lunch")
}
