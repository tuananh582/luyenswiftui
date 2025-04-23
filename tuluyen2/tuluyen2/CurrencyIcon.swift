//
//  CurrencyIcon.swift
//  tuluyen2
//
//  Created by TuanAnh on 12/3/25.
//

import SwiftUI

struct CurrencyIcon: View {
    let currencyImage:ImageResource
    let currencyName:String
    var body: some View {
        // Currency icons
        ZStack(alignment: .bottom) {
            Image(currencyImage).resizable().scaledToFit()
            // Currency Name
            Text(currencyName).padding(3).font(.caption).frame(maxWidth: .infinity).background(.brown.opacity(0.75))
        }
        .padding(3)
        .frame(width: 100, height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 25))

        // Text

        // Currency icons
    }
}

#Preview {
    CurrencyIcon(currencyImage: .goldpiece, currencyName: "Gold Penny")
}
