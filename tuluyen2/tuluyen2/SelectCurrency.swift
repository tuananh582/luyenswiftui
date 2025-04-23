//
//  SelectCurrency.swift
//  tuluyen2
//
//  Created by TuanAnh on 12/3/25.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var TopCurrency: Currency
    @Binding var BottomCurrency: Currency
    var body: some View {
        ZStack {
            // Parchement background image
            Image(.parchment).resizable().ignoresSafeArea().background(.brown)
            
            VStack {
                // Text
                Text("Select the currency you're starting with : \(Currency.silverPiece.rawValue)").fontWeight(.bold)
                
                // Currency icons
                IconGrid(currency: $TopCurrency)
                
                // Text
                Text("Select the currency you would like to convert to ").fontWeight(.bold).padding(.top)
                
                // Currency icons
                IconGrid(currency: $BottomCurrency)
                
                // Done Button
                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent).tint(.brown.mix(with: .black, by: 0.2)).font(.largeTitle).padding().foregroundStyle(.white)
            }
            .padding()
            .multilineTextAlignment(.center)
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    @Previewable @State var TopCurrency:Currency = .silverPenny
    @Previewable @State var BottomCurrency:Currency = .goldPenny
    SelectCurrency(TopCurrency: $TopCurrency, BottomCurrency: $BottomCurrency)
}
