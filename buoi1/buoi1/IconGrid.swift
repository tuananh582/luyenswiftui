//
//  IconGrid.swift
//  buoi1
//
//  Created by TuanAnh on 30/10/24.
//

import SwiftUI

struct IconGrid: View {
    @Binding var currency: Currency
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            ForEach(Currency.allCases) { currency in
                if currency == self.currency {
                    CurrencyIcon(currencyImge: currency.image, currencyName: currency.name).shadow(color: .black, radius: 10).overlay {
                        RoundedRectangle(cornerRadius: 25).stroke(lineWidth: 3).opacity(0.5)
                    }
                } else {
                    CurrencyIcon(currencyImge: currency.image, currencyName: currency.name).onTapGesture {
                        self.currency = currency
                    }
                }
            }
        }
    }
}

#Preview {
    IconGrid(currency: .constant(.silverPiece))
}
