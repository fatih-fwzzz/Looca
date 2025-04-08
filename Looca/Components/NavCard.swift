//
//  NavCard.swift
//  CobaLooca
//
//  Created by Patricia Putri Art Syani on 25/03/25.
//

import SwiftUI

struct NavCard: View {
    @State private var isShowingImage = false
    @State private var imageName = "parking lot"
    
    let direction: Direction  // Accept a Direction object
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.blue, lineWidth: 2)
                .shadow(radius: 4)
            
            VStack {
                HStack {
                    Image(systemName: "arrow.forward")
                        .foregroundColor(.white)
                        .font(.title)
                        .background(
                            Circle()
                                .foregroundColor(.blue)
                                .frame(width: 40, height: 40)
                        )
                    Spacer()
                    VStack (alignment: .leading) {
                        Text(direction.description)  // Show direction description
                            .font(.title3)
                        Text("After \(direction.afterMeters) meters")  // Show distance
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                
                // Image card with tap gesture
                Image(direction.image)  // Use the image from direction
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .clipped()
                    .onTapGesture {
                        isShowingImage.toggle()
                        imageName = direction.image
                    }
            }
            .padding(12)
        }
        .frame(maxWidth:.infinity)
        .fullScreenCover(isPresented: $isShowingImage) {
            DetailImage(isShowingImage: $isShowingImage, imageName: imageName)
        }
    }
}


struct DetailImage: View {
    
    @Binding var isShowingImage: Bool
    var imageName: String
    
    @GestureState private var zoomScale: CGFloat = 1.0
    @State private var finalScale: CGFloat = 1.0
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.black.ignoresSafeArea()
            
            GeometryReader { geometry in
                ScrollView([.vertical, .horizontal], showsIndicators: false) {
                    if let uiImage = UIImage(named: imageName) {
                        let initialScale: CGFloat = 1.0
                        let totalScale = max(initialScale, finalScale * zoomScale)
                        
                        
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
//                            .aspectRatio(contentMode: .fit)
//                            .scaleEffect(finalScale * zoomScale)
                            .frame(width: geometry.size.width * totalScale)
                            .gesture(
                                MagnificationGesture()
                                    .updating($zoomScale) { value, state, _ in state = value
                                    }
                                    .onEnded { value in
                                        finalScale *= value
                                        finalScale = max(initialScale, finalScale)
                                    }
                                    
                            )
                            .animation(.easeInOut, value: totalScale)
                    } else {
                        Text("Image not found")
                            .foregroundColor(.white)
                            .padding()
                    }
                }
                
            }
            
//            Image(imageName)
//                .resizable()
//                .scaledToFit()
//                .padding()
//                .transition(.scale)
            
            Button(action: {
                isShowingImage = false
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                    .padding()
            }
        }
    }
}

//#Preview {
//    DetailImage(isShowingImage: .constant(false))
//}

//#Preview {
//    NavCard()
//}
