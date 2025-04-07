//
//  TenantCard.swift
//  Looca
//
//  Created by FWZ on 27/03/25.
//

import SwiftUI

struct TenantCard: View  {
    var imageName: String
    var tenantName: String
    
    
    var body: some View {
        ZStack {
            // Background Image
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipped()
                .cornerRadius(16)
                .shadow(radius: 5)
            
            // Overlay Text
            Text(tenantName)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
                .background(Color.black.opacity(0.5))
                .cornerRadius(10)
            
            
        }
        .frame(width: 100, height: 100)
        //        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
    }
}

#Preview {
    TenantCard(imageName: "restaurant", tenantName: "GOP 9 Locaxtion")
}
