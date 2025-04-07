//
//  ContentView.swift
//  CobaLooca
//
//  Created by Patricia Putri Art Syani on 25/03/25.
//

import SwiftUI

struct NavView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack (){
                    NavCard()
                    NavCard()
                    NavCard()
                }
                .padding()
            }
            .navigationBarTitle("Direction")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color.gray)
                            .font(.subheadline)
                    }
                }
            }
        }
    }
}

#Preview {
    NavView()
}
