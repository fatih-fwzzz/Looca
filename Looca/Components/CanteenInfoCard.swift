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
        HStack(spacing: 16) {
            infoCard(
                icon: "door.left.hand.open",
                text: openHours
            )
            
            infoCard(
                icon: "figure.walk",
                text: "\(estimate) min"
            )
            
            infoCard(
                icon: "mappin.and.ellipse",
                text: "\(distance) m"
            )
        }
    }
    
    // Helper view for each card
    @ViewBuilder
    private func infoCard(icon: String, text: String) -> some View {
        VStack(alignment: .center, spacing: 5) {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(height: 26)
                .padding(.bottom, 5) // consistent icon size
            Text(text)
                .font(.subheadline)
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(width: 95, height: 65)
        .padding(10)
        .background(Color("SecondColor"))
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}

#Preview {
    CanteenInfoCard(openHours: "23.00 - 24.00", estimate: 10, distance: 100)
}
