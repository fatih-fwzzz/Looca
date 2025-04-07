//
//  NavigateButton.swift
//  Looca
//
//  Created by FWZ on 27/03/25.
//

import SwiftUI

struct NavigateButton: View {
    
    var body: some View {
        HStack {
            Image(systemName: "location.fill")
            Text("Start Navigation")
                
        }
        .font(.headline)
        .foregroundColor(.white)
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.blue)
        .cornerRadius(10)
    }
}

#Preview {
    NavigateButton()
}
