//
//  AdditionalInfoCard.swift
//  Looca
//
//  Created by FWZ on 08/04/25.
//

import SwiftUI

struct AdditionalInfoCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                HStack {
                    Image(systemName: "storefront.fill")
                        .frame(width: 28, alignment: .leading)
                    Text("Best Dish").fontWeight(.semibold)
                }
                Spacer()
                Text("Mie Ayam Kasturi")
                    .font(.subheadline)
            }
            HStack {
                HStack {
                    Image(systemName: "chair.lounge.fill")
                        .frame(width: 28, alignment: .leading)
                    Text("Atmosphere").fontWeight(.semibold)
                }
                Spacer()
                Text("Cozy & Comfy")
                    .font(.subheadline)
            }
            HStack {
                HStack {
                    Image(systemName: "dollarsign.circle.fill")
                        .frame(width: 28, alignment: .leading)
                    Text("Budget").fontWeight(.semibold)
                }
                Spacer()
                Text("IDR 15.000 - 35.000")
                    .font(.subheadline)
            }
            HStack {
                HStack {
                    Image(systemName: "person.2.fill")
                        .frame(width: 28, alignment: .leading)
                    Text("Frequency").fontWeight(.semibold)
                }
                Spacer()
                Text("Moderately Busy")
                    .font(.subheadline)
            }
        }
        .padding()
    }
}

#Preview {
    AdditionalInfoCard()
}
