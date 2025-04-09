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
                VStack(spacing: 10) {
                    Spacer()

                    Image(systemName: "mappin.and.ellipse")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                        .padding()
                        .background(Circle().fill(Color.blue))

                    Text("GOP 9")
                        .font(.title)
                        .bold()
                        .foregroundColor(.blue)

                    Text("Navigation Complete")
                        .font(.headline)
                        .foregroundColor(.blue)

                    Text("You have reached your destination and arrived at Canteen GOP 9")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Button(action: {
                        onBack?()
                        dismiss()
                        showBackPage.toggle()
                    }) {
                        Text("Go Back to Starting Maps")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("MainColor"))
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.horizontal)
                    }

                    Spacer()
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
//                        .stroke(Color("MainColor"), lineWidth: 3)
                        .offset(y:70)
                )
                .cornerRadius(10)
                .frame(width: .infinity, height:100)
                .padding()
            }
        }


//#Preview {
//    CompletionScreenView()
//}
