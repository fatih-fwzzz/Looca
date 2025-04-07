//
//  MenuView.swift
//  Looca
//
//  Created by FWZ on 27/03/25.
//

import SwiftUI

struct MenuViewSatu: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var path: [Int]
    @Binding var showingSheetFirst: Bool
    
    var body: some View {
        NavigationStack {
            List(1...10, id: \.self) { num in
                Button("Go to Detail \(num)") {
                    dismiss()  // Dismiss the current sheet first
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { // Small delay for smooth transition
                        showingSheetFirst = false  // Ensure sheet closes completely
                        path.append(num)  // Navigate to detail page
                    }
                }
            }
            .navigationTitle("Search")
        }
    }
}

//#Preview {
//    MenuView()
//}
