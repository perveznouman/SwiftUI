//
//  Test.swift
//  Try
//
//  Created by Nouman Pervez on 08/01/24.
//

import SwiftUI

struct Test: View {
    var body: some View {
        VStack {
            Image(systemName: "heart.fill")
                .padding(.bottom, 30)
            Image("eye")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 30) //Can apply frame also
            
            AsyncImage(url: URL(string: "https://images.unsplash.com/photo-1552727131-5fc6af16796d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3898&q=80")) { image in
                image.resizable()
            } placeholder: {
                Text("Downloading..")
            }
            .padding(.all, 40)
            
            Text("Nouman")
                .padding([.bottom, .top], 40)
            Text("Pervez")
        
            
        }.foregroundColor(.orange) //Applies to the whole stack

    }
}

#Preview {
    Test()
}
