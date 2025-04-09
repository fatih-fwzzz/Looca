//
//  StepNavigationView.swift
//  Looca
//
//  Created by Patricia Putri Art Syani on 09/04/25.
//

import SwiftUI
import MapKit

struct StepNavigationView: View {
    @State private var directionSteps: [DirectionStep] = [
        DirectionStep(
            description: "Turn right at Parking Lot GOP 9",
            afterMeters: "200 meters",
            image: "parking lot", // must be in Assets
            arrow: "arrowshape.right.circle.fill",
            coordinate: CLLocationCoordinate2D(latitude: -6.364, longitude: 106.828)
        ),
        DirectionStep(
            description: "Walk straight Across Zebra Cross",
            afterMeters: "150 meters",
            image: "zebra cross",
            arrow: "arrowshape.up.circle.fill",
            coordinate: CLLocationCoordinate2D(latitude: -6.3635, longitude: 106.827)
        )
    ]
    
    @State private var currentStepIndex = 0
    @State private var showCompletionScreen = false
    @State private var showDirectionStep: Bool = true
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -6.364, longitude: 106.828),
        span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
        
        
    )
    
    var currentStep: DirectionStep {
        directionSteps[currentStepIndex]
    }
    
    
    //
    var body: some View {
        ZStack {
            Map{
                Marker("GOP" ,coordinate: currentStep.coordinate)
                
            }
            .ignoresSafeArea(edges: .all)
            
            if showDirectionStep {
                VStack {
                    Spacer()
                    
                    VStack {
                        HStack {
                            Image(systemName: currentStep.arrow)
                                .resizable()
                                .frame(width: 28, height: 28)
                                .foregroundColor(Color.white)
                            VStack (alignment: .leading) {
                                Text(currentStep.description)
                                    .font(.headline)
                                    .foregroundColor(Color.white)
                                Text("after \(currentStep.afterMeters)")
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.8))
                                
                            }
                            Spacer()
                        }
                        .padding(.bottom, 5)
                        Image(currentStep.image)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 120)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .padding(.bottom, 5)
                        HStack {
                            Button(action: {
                                if currentStepIndex > 0 {
                                    withAnimation {
                                        self.currentStepIndex -= 1
                                    }
                                }
                            }) {
                                Text("< Previously")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color("MainColor"))
                                    .padding()
                                    .frame(maxWidth: .infinity, maxHeight: 40)
                                    .background(Color.white)
                                    .cornerRadius(12)
                                
                            }
                            
                            Button(action: {
                                if currentStepIndex < directionSteps.count - 1 {
                                    withAnimation { self.currentStepIndex += 1 }
                                } else {
                                    withAnimation {
                                        showCompletionScreen = true
                                        showDirectionStep = false
                                    }
                                }
                            }) {
                                Text(currentStepIndex < directionSteps.count - 1 ? "Next >" :"Finish")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color("MainColor"))
                                    .padding()
                                    .frame(maxWidth: .infinity, maxHeight: 40)
                                    .background(Color.white)
                                    .cornerRadius(12)
                                
                            }
                        }
                    }
                    .padding()
                    .background(Color("MainColor"))
                    .clipShape(RoundedRectangle(cornerRadius:16))
                    .padding()
                }
            }
            
        }
        .fullScreenCover(isPresented: $showCompletionScreen) {
            CompletionScreenView()
        }
    }
}


#Preview {
    StepNavigationView()
}
