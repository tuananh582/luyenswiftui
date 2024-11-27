//
//  CurrencyIcon.swift
//  buoi1
//
//  Created by TuanAnh on 16/10/24.
//

import SwiftUI

struct CurrencyIcon: View {
    let currencyImge: ImageResource
    let currencyName: String
    var body: some View {
        ZStack(alignment: .bottom) {
            // Currency Image
            Image(currencyImge).resizable().scaledToFit()
            

            // Currency Name
            
            Text(currencyName).padding(3).font(.caption).frame(maxWidth: .infinity).background(.brown.opacity(0.75))
            
        }
        .padding(3)
        .frame(width: 100, height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 25))
    }
}

#Preview {
    CurrencyIcon(currencyImge: .goldpiece, currencyName: "Tuan Anh")
}
