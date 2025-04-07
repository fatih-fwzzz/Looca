//
//  CanteenInfoCard.swift
//  Looca
//
//  Created by FWZ on 27/03/25.
//

import SwiftUI

struct CanteenInfoCard: View {
    var openHours: String
    var estimate: Int
    var distance: Int
    var body: some View {
        HStack {
            VStack{
                Text("Open Hours")
                    .font(.headline)
                    .fontWeight(.semibold)
                Text(openHours)
                    .font(.subheadline)
                    .fontWeight(.light)
            }
            VStack{
                Text("Estimation")
                    .font(.headline)
                    .fontWeight(.semibold)
                Text("\(estimate) min / Walk")
                    .font(.subheadline)
                    .fontWeight(.light)
            }
            .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
            .overlay(
                Rectangle()
                    .frame(width: 0.5, height: 60) // Thin vertical line
                    .foregroundColor(.gray),
                alignment: .leading // Left border
            )
            .overlay(
                Rectangle()
                    .frame(width: 0.5, height: 60) // Thin vertical line
                    .foregroundColor(.gray),
                alignment: .trailing // Right border
            )
            VStack{
                Text("Distance")
                    .font(.headline)
                    .fontWeight(.semibold)
                Text("\(distance) km")
                    .font(.subheadline)
                    .fontWeight(.light)
            }
            
        }
    }
}

#Preview {
    CanteenInfoCard(openHours: "07.00 - 15.00", estimate: 5, distance: 1)
}
