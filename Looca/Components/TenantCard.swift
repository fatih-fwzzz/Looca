//
//  TenantCard.swift
//  Looca
//
//  Created by FWZ on 27/03/25.
//

import SwiftUI

struct TenantCard: View {
    var imageName: String
    var tenantName: String
    var tenantDescription: String // <-- add this
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            // Background Image
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .clipped()
                .cornerRadius(5)
                .shadow(radius: 5)
            
            // Gradient Background
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 150, height: 150)
                .background(
                    LinearGradient(
                        stops: [
                            .init(color: .black, location: 0.00),
                            .init(color: Color(red: 0.4, green: 0.4, blue: 0.4).opacity(0), location: 1.00)
                        ],
                        startPoint: UnitPoint(x: 0.73, y: 0.72),
                        endPoint: UnitPoint(x: 0.37, y: 0.26)
                    )
                )
                .cornerRadius(10)
                .opacity(0.44)
                .frame(width: 150, height: 150)
            
            // Text Content
            VStack(alignment: .leading, spacing: 2) {
                Text(tenantName)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text(tenantDescription)
                    .font(.caption2)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
            }
            .padding([.leading, .bottom], 10)
        }
        .frame(width: 150, height: 150)
        .padding(.trailing, 20)
    }
}

#Preview {
    TenantCard(imageName: "restaurant", tenantName: "Mama Djempol", tenantDescription: "Soto Ayam, Nasi Goreng")
}
