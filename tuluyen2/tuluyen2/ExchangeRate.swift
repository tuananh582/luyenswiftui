//
//  ExchangeRate.swift
//  tuluyen2
//
//  Created by TuanAnh on 12/3/25.
//
import SwiftUI
struct ExchangeRate: View {
    let leftImage:ImageResource
    let text:String
    let rightImage:ImageResource
    var body: some View {
        HStack{
            //Left currency Image
            Image(leftImage).resizable().scaledToFit().frame(height: 33)
            
            // Exchange Rate Text
            Text(text)
            
            
            // Right currency image
            Image(rightImage).resizable().scaledToFit().frame(height: 33)
            
        }
    }
}
#Preview{
    ExchangeRate(leftImage: .silverpiece, text: "1 Silver Piece = 4 Silver Pennies", rightImage: .silverpenny)
}

