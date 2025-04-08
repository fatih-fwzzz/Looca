//
//  MenuListView.swift
//  Looca
//
//  Created by FWZ on 08/04/25.
//

import SwiftUI

struct MenuListView: View {
    
    // An array of 12 items
    let items = [
        "Kasturi", "Nusantara", "Sunda", "Bali", "Java", "Aceh",
        "Medan", "Padang", "Makassar", "Sulawesi", "Papua", "Kalbar"
    ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(0..<items.count, id: \.self) { index in
                VStack(alignment: .leading) {
                    Text(items[index])
                        .font(.headline)
                    Text("Ini enak bro")
                        .font(.subheadline)
                    Text("Rp 20.000")
                        .font(.subheadline)
                    Text("is it recommended: Yes")
                }
                .padding()
            }
        }
        

    }
}

#Preview {
    MenuListView()
}
