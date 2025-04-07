//
//  NavigateButton.swift
//  Looca
//
//  Created by FWZ on 27/03/25.
//

import SwiftUI

struct NavigateButton: View {
    @Binding var showDirections: Bool
    var body: some View {
        Button (action :{
            showDirections.toggle()
        }) {
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
        //lokasi buttonnya di layar
//        .padding(.bottom, 200)
//        .contentMargins(20)
    }
}

#Preview {
    NavigateButton(showDirections: .constant(false))
}
