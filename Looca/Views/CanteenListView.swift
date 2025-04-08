//
//  CanteenListView.swift
//  Looca
//
//  Created by FWZ on 08/04/25.
//

import SwiftUI

import SwiftUI

import SwiftUI

import SwiftUI

import SwiftUI

struct CanteenListView: View {
    // An array of 12 items
    let items = [
        "Kasturi", "Nusantara", "Sunda", "Bali", "Java", "Aceh",
        "Medan", "Padang", "Makassar", "Sulawesi", "Papua", "Kalbar"
    ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            HStack(spacing: 16) {
                // First Vertical List (Left side)
                VStack(spacing: 16) {
                    ForEach(0..<items.count / 2, id: \.self) { index in
                        VStack {
                            Image("restaurant") // Replace with your image asset or dynamic image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .cornerRadius(8)
                            
                            Text(items[index])
                                .font(.headline)
                            
                            Text("Javanese Tenant")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            Text("Rp 20.000 - 40.000")
                                .font(.subheadline)
                                .foregroundColor(.green)
                        }
                        .frame(width: 150)
                    }
                }
                
                // Second Vertical List (Right side)
                VStack(spacing: 16) {
                    ForEach(items.count / 2..<items.count, id: \.self) { index in
                        VStack {
                            Image("restaurant") // Replace with your image asset or dynamic image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .cornerRadius(8)
                            
                            Text(items[index])
                                .font(.headline)
                            
                            Text("Indonesian Tenant")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            Text("Rp 30.000 - 50.000")
                                .font(.subheadline)
                                .foregroundColor(.green)
                        }
                        .frame(width: 150)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    CanteenListView()
}
