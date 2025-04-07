
import SwiftUI

struct OnboardingPage2View: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Background color
                Color("PrimaryColor")
                    .ignoresSafeArea()
                
                // Background image of buildings
                VStack {
                    Spacer()
                    Image("cityBackground") // Ganti dengan nama asset background kamu
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                }
                .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 16) {
                    // Logo kecil di kiri atas
                    Image("loocaLogo") // Ganti dengan logo kecil kamu
                        .resizable()
                        .frame(width: 60, height: 60)
                        .padding(.top, 150)
                    
                    // Title
                    Text("Finding Canteen\nCan Be Easy")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    // Description
                    Text("With Looca Finding Canteens\nAround GOP will be easier and\nmore efficient")
                        .font(.body)
                        .foregroundColor(.white.opacity(0.9))
                    
                    Spacer()
                    
//                    // Next Button
//                    NavigationLink{
//                        ContentView()
//                    }
//                    label: {
//                        Text("Get Started")
//                            .font(.headline)
//                            .foregroundColor(Color(red: 0.04, green: 0.17, blue: 0.37))
//                            .frame(maxWidth: .infinity)
//                            .padding()
//                            .background(Color.white)
//                            .cornerRadius(12)
//                            .padding(.horizontal, 24)
//                    }
//                    .padding(.bottom, 30)
                }
                .padding(.horizontal, 24)
            }
        }
    }
}

#Preview {
    OnboardingPage2View()
}
