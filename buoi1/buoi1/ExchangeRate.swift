//
//  ExchangeRate.swift
//  buoi1
//
//  Created by TuanAnh on 14/10/24.
//

import SwiftUI
struct ExchangeRate: View {
    let leftImage:ImageResource
    let text:String
    let rightImage:ImageResource
    var body: some View {
        HStack {
            // left currency Image
            Image(leftImage).resizable().scaledToFit().frame(height: 33)
            // Exchange rate text
            Text(text)
            // Right currency Image
            Image(rightImage).resizable().scaledToFit().frame(height: 33)
        }
    }
}
#Preview {
    ExchangeRate(leftImage: .silverpiece,text: "1 Silver Piece = 4 Silver Pennies", rightImage: .silverpenny)
}
