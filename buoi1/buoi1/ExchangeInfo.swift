//
//  ExchangeInfo.swift
//  buoi1
//
//  Created by TuanAnh on 14/10/24.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            // Background parchtment Image
            Image(.parchment).resizable().ignoresSafeArea().background(.brown)
            VStack {
                // Title Text
                Text("Exchange Rate")
                    .font(.largeTitle).tracking(3)
                    
                // Description Text
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:").font(.title2).padding()
                
                // Exchange Rate
                ExchangeRate(leftImage: .goldpiece, text: "1 Gold Piece =  4 Gold Pennies", rightImage: .goldpenny)
                ExchangeRate(leftImage: .goldpenny, text: "1 Gold Penny = 4 Sliver Pieces", rightImage:.silverpiece)
                ExchangeRate(leftImage:.silverpiece, text: "1 Silver Piece = 4 Silver Pennies", rightImage: .silverpenny)
                ExchangeRate(leftImage: .silverpenny, text: "1 Silver Penny = 100 Copper Pennies", rightImage: .copperpenny)
                // Done Button
                Button("Done"){
                    dismiss()
                }.buttonStyle(.borderedProminent).tint(.brown).font(.largeTitle).padding().foregroundStyle(.white)
            }
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    ExchangeInfo()
}

