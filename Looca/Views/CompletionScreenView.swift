//
//  ArrivedView.swift
//  CobaLooca
//
//  Created by Patricia Putri Art Syani on 09/04/25.
//

import SwiftUI

struct CompletionScreenView: View {
    @Binding var showBackPage: Bool
    
    var onBack: (() -> Void)? = nil
    @Environment(\.dismiss) var dismiss
    
            var body: some View {
                VStack() {
                    Spacer()
                    Text("GOP 9")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color("MainColor"))
                    
                    Image("CompleteSticker")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 350, height: 350)
                        .offset(x: 0, y: 40)
                        .clipped()

                    Text("You Have Reach Your Destination")
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("MainColor"))
                    Spacer()
                    
                    Button(action: {
                        onBack?()
                        dismiss()
                        showBackPage.toggle()
                    }) {
                        Text("Go Back to Starting Maps")
                            .font(.subheadline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("MainColor"))
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.horizontal)
                    }
                }
                .padding()
                .padding()
            }
        }


#Preview {
    CompletionScreenView()
}
