//
//  CardView.swift
//  Try
//
//  Created by Nouman Pervez on 22/02/24.
//

import SwiftUI

struct FrontView: View {
    
    var cardInfo: CardInfo
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "checkmark.circle.fill")
                    .padding()
                Spacer()
                Text("VISA")
                    .font(.system(size: 24, weight: .bold, design: .monospaced))
                    .italic()
                    .padding()
            }
            
            Spacer()
            
            Text(cardInfo.cardNumber)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .padding()
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Card Holder Name")
                        .opacity(0.8)
                        .font(.system(size: 16))
                    Text(cardInfo.cardHolderName)
                        .font(.system(size: 16, weight: .semibold))
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Expires At")
                        .opacity(0.8)
                        .font(.system(size: 16))
                    Text(cardInfo.cardExpiry)
                        .font(.system(size: 16, weight: .semibold))
                }
            }
            .padding()
            
            Spacer()

        }
        .foregroundStyle(.white)
        .frame(width: 350, height: 250)
        .background {
            LinearGradient(colors: [.blue, .green], startPoint: .topLeading, endPoint: .bottomTrailing)
        }
        .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
//        Spacer()
    }
}

struct BackView: View {
    var cardInfo: CardInfo

    var body: some View {
        VStack {
            Rectangle()
                .fill(.black)
                .frame(maxWidth: .infinity, maxHeight: 23)
                .padding([.top], 20)
            Spacer()
            
            HStack {
                Text(cardInfo.cardCVV)
                    .frame(width: 100, height: 33, alignment: .leading)
                    .background(.white)
                    .foregroundStyle(.black)
                    .rotation3DEffect(
                        .degrees(180),
                        axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/
                    )
                    .padding([.leading, .trailing, .bottom], 20)
                    Spacer()
            }
        }
        .foregroundStyle(.white)
        .frame(width: 350, height: 250)
        .background {
            LinearGradient(colors: [.blue, .green], startPoint: .topLeading, endPoint: .bottomTrailing)
        }
        .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
    }
}

struct CardInfo {
    var cardNumber: String = ""
    var cardHolderName: String = ""
    var cardExpiry: String = ""
    var cardCVV: String = ""

}

struct InputView: View {
    
    @Binding var cardInfo: CardInfo
    @FocusState private var isCCVFocussed: Bool
    let onCCVFocussed: () -> Void
    var body: some View {
        Form {
            TextField("Card Number", text: $cardInfo.cardNumber)
            TextField("Card Holder", text: $cardInfo.cardHolderName)
            TextField("Expiry Date", text: $cardInfo.cardExpiry)
            TextField("CVV", text: $cardInfo.cardCVV)
                .focused($isCCVFocussed)
        }.onChange(of: isCCVFocussed) {
            onCCVFocussed()
        }
    }
}

struct CardView: View {
    
    @State private var cardInfo = CardInfo()
    @State private var flip: Bool = false
    @State private var degree: Double = 0
    
    var body: some View {
        VStack {
            VStack {
                if !flip {
                    FrontView(cardInfo: cardInfo)
                }
                else {
                    BackView(cardInfo: cardInfo)
                }
            }.rotation3DEffect(
                .degrees(degree),
                axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/
            )
            InputView(cardInfo: $cardInfo, onCCVFocussed: {
                withAnimation {
                    degree += 180
                    flip.toggle()
                }
            })
            
        }
        .navigationTitle("Card Details")
    }
}

#Preview {
    NavigationStack {
        CardView()
    }
        
}
