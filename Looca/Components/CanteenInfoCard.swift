//
//  CanteenInfoCard.swift
//  Looca
//
//  Created by FWZ on 27/03/25.
//

import SwiftUI

struct CanteenInfoCard: View {
    var openHours: String
    var estimate: Int
    var distance: Int
    
    var body: some View {
        HStack(spacing: 16) { // spacing between the cards
            VStack {
                Image(systemName: "door.left.hand.open")
                    .padding(.bottom, 5)
//                Text("Open Hours")
//                    .font(.headline)
//                    .fontWeight(.semibold)
                Text(openHours)
                    .font(.subheadline)
                    .fontWeight(.regular)
            }
            .frame(width: 90, height: 60)
            .padding(10)
            .background(Color("SecondColor"))
            .cornerRadius(12)
            .shadow(radius: 2)

            VStack {
                Image(systemName: "clock")
                    .padding(.bottom, 5)
//                Text("Estimation")
//                    .font(.headline)
//                    .fontWeight(.semibold)
                Text("\(estimate) min / Walk")
                    .font(.subheadline)
                    .fontWeight(.regular)
            }
            .frame(width: 90, height: 60)
            .padding(10)
            .background(Color("SecondColor"))
            .cornerRadius(12)
            .shadow(radius: 2)

            VStack {
                Image(systemName: "mappin.and.ellipse")
                    .padding(.bottom, 5)
//                Text("Distance")
//                    .font(.headline)
//                    .fontWeight(.semibold)
                Text("\(distance) m")
                    .font(.subheadline)
                    .fontWeight(.regular)
            }
            .frame(width: 90, height: 60)
            .padding(10)
            .background(Color("SecondColor"))
            .cornerRadius(12)
            .shadow(radius: 2)
        }
    }
}

#Preview {
    CanteenInfoCard(openHours: "07.00 - 15.00", estimate: 5, distance: 1)
}
