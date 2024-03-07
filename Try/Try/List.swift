//
//  List.swift
//  Try
//
//  Created by Nouman Pervez on 09/01/24.
//

import SwiftUI

struct ListView: View {
    
    let hikes = [Hike(name: "Everest", image: "One", height: 7.0),
                 Hike(name: "Makalu", image: "Two", height: 7.6),
                 Hike(name: "Cho Oyu", image: "Three", height: 5.3)]

    
    var body: some View {
        
        NavigationStack {
            List(hikes) { hike in
                if(hike.height > 6.0) {
                    NavigationLink(value: hike) {
                        HikeCell(hike: hike)
                    }
                }
                else {
                    HikeCell(hike: hike)
                }
            }
            .navigationTitle("Hike")
            .navigationDestination(for: Hike.self) { hike in
                DestinationView(hike: hike)
            }
        }
        
    }
    
}

#Preview {
    ListView()
}

struct HikeCell: View {
    let hike: Hike
    
    var body: some View {
        HStack(alignment:.center) {
            Image(hike.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 15, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
            VStack(alignment:.leading) {
                Text(hike.name)
                    .fontWeight(.black)
                Text("\(hike.height.formatted()) Miles")
                
            }
        }
    }
}
