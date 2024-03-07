//
//  DestinationView.swift
//  Try
//
//  Created by Nouman Pervez on 10/01/24.
//

import SwiftUI

struct DestinationView: View {
    
    let hike: Hike
    @State var isZoomed = false
    
    var body: some View {
        VStack {
            Spacer()
            Image(hike.image)
                .resizable()
                .aspectRatio(contentMode: isZoomed ? .fill : .fit)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .padding(.bottom, 40)
                .onTapGesture {
                    withAnimation {
                        isZoomed.toggle()
                    }
                }
            Text(hike.name)
                .font(.title)
            Text("\(hike.height.formatted()) Miles")
            Spacer()
                .navigationTitle(hike.name)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NavigationStack {
        DestinationView(hike: Hike(name: "Everest", image: "One", height: 7.0))
    }
}
