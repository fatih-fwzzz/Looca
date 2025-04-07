//
//  OnboardingContainerView.swift
//  coba lagi
//
//  Created by Yohanes Valentino Stanley on 07/04/25.
//

import SwiftUI

struct OnboardView: View {
    @State private var currentPage = 0
    @State private var gotoMainPage: Bool = false
    
    
    var body: some View {
        NavigationStack {
            VStack {
                TabView(selection: $currentPage) {
                    OnboardingPageView()
                        .tag(0)
                    
                    OnboardingPage2View()
                        .tag(1)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .animation(.easeInOut, value: currentPage)
                
                Spacer()
                
                Button(action: {
                    if currentPage < 1 {
                        currentPage += 1
                    } else {
                        // Navigate to home or login screen
                        gotoMainPage = true
                        print("Get Started tapped")
                    }
                }) {
                    Text(currentPage < 1 ? "Next" : "Get Started")
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(12)
                        .padding(.horizontal, 24)
                    
                }
                .padding(.bottom, 40)
                
                
            }
            .navigationDestination(isPresented: $gotoMainPage) {
                ContentView()
            }
            .ignoresSafeArea()
            .background(Color("MainColor"))
        }
    }
}

#Preview {
    OnboardView()
}

