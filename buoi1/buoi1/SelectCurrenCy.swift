//
//  SelectCurrenCy.swift
//  buoi1
//
//  Created by TuanAnh on 16/10/24.
//

import SwiftUI

struct SelectCurrenCy: View {
    @Environment(\.dismiss) var dismiss
    @Binding var topCurrency:Currency
    @Binding var bottomCurrency:Currency
    var body: some View {
        ZStack {
            // Parchment Background
            Image(.parchment).resizable().ignoresSafeArea().background(.brown)

            VStack {
                // Text
                Text("Select the currency you want to use").fontWeight(.bold)

                // Currency icons
                IconGrid(currency: $topCurrency)
                // Text
                Text("Select the currency you'd like to convert to:")
                    .fontWeight(.bold).multilineTextAlignment(.center)

                // Currency icons
                IconGrid(currency: $bottomCurrency)

                // Done Button
                Button("Done") {
                    dismiss()
                }.buttonStyle(.borderedProminent).tint(.brown).font(.largeTitle).padding().foregroundStyle(.white)
            }
            .padding()
        }
    }
}

#Preview {
    SelectCurrenCy(topCurrency: .constant(.silverPiece), bottomCurrency: .constant(.goldPiece))
}
