//
//  NavCard.swift
//  CobaLooca
//
//  Created by Patricia Putri Art Syani on 25/03/25.
//

import SwiftUI

struct NavCard: View {
    
    @State var isShowingImage = false
    @State var imageName = "parking lot"
    
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
                                Text("Turn right at Parking Lot GOP 9")
                                    .font(.title3)
                                Text("After 200 m")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                        
                        //image card with tap
                        Image("parking lot")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: nil, height: 150)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .clipped()
                            .onTapGesture {
                                isShowingImage.toggle()
                                imageName = "parking lot"
                            }
                        
//
                        
                    }
                    .padding(12)
            }
            .frame(maxWidth:.infinity)
            .fullScreenCover(isPresented: $isShowingImage) { DetailImage(isShowingImage: $isShowingImage, imageName: imageName)
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

#Preview {
    NavCard()
}
