import SwiftUI

struct OnboardingPageView: View {
    
    var body: some View {
            ZStack {
                // Background Color
                Color("MainColor")
                    .ignoresSafeArea()
                
                VStack(spacing: 1) {
                    Spacer()
                    
                    // Logo Image (replace "loocaLogo" with your asset name)
                    Image("loocaLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 180, height: 180)
                    
                    // Title
                    Text("LOOCA")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer()
                }
            }
    }
}

#Preview {
    OnboardingPageView()
}
