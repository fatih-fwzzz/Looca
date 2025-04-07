//
//  ContentView.swift
//  CobaLooca
//
//  Created by Patricia Putri Art Syani on 25/03/25.
//

import SwiftUI

struct NavView: View {
    @Binding var showNavSheet: Bool
    @Binding var showCanteenInfoSheet: Bool
    
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
                        showNavSheet = false
                        showCanteenInfoSheet = true
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
    NavView(showNavSheet: .constant(true), showCanteenInfoSheet: .constant(false))
}
