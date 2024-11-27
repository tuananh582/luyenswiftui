//
//  ContentView.swift
//  buoi1
//
//  Created by TuanAnh on 9/10/24.
//

import SwiftUI
import TipKit
struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectorCurreny = false
    @State var leftAmount = ""
    @State var rightAmount = ""

    @FocusState var leftTyping
    @FocusState var rightTyping

    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece

    var body: some View {
        ZStack {
            // Background image
            Image(.background).resizable().ignoresSafeArea()
            VStack {
                // Prancing pony image
                Image(.prancingpony).resizable().scaledToFit().frame(height: 200)

                // Currency Exchange text
                Text("Currency Exchange").font(.largeTitle).foregroundStyle(.white)
                HStack {
                    // left conversion section
                    VStack {
                        // Currency
                        HStack {
                            // Currency Image
                            Image(leftCurrency.image).resizable().scaledToFit().frame(height: 33)
                            // Currency Text
                            Text(leftCurrency.name).font(.headline).foregroundStyle(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectorCurreny.toggle()
                        }
                        .popoverTip(CurrencyTip(), arrowEdge: .bottom)
                        // TextField
                        TextField("Amount", text: $leftAmount).textFieldStyle(.roundedBorder).focused($leftTyping).keyboardType(.decimalPad)
                    
                    }

                    Image(systemName: "equal").font(.largeTitle).foregroundStyle(.white).symbolEffect(.pulse)
                    VStack {
                        // Currency
                        HStack {
                            // Currency Text
                            Text(rightCurrency.name).font(.headline).foregroundStyle(.white)
                            // Currency Image
                            Image(rightCurrency.image).resizable().scaledToFit().frame(height: 33)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectorCurreny.toggle()
                        }
                        // TextField
                        TextField("Amount", text: $rightAmount).textFieldStyle(.roundedBorder).multilineTextAlignment(.trailing).focused($rightTyping).keyboardType(.decimalPad)
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                        print("Show Exchange Info : \(showExchangeInfo)")

                    } label: {
                        Image(systemName: "info.circle.fill").font(.largeTitle).foregroundStyle(.white)
                    }
                    .padding(.trailing)
                }
            }
            .sheet(isPresented: $showExchangeInfo) {
                ExchangeInfo()
            }
            .task {
                try?Tips.configure()
            }
            .onChange(of: leftAmount) {
                if leftTyping { // leftTyping true
                    rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
                }
            }
            .onChange(of: leftCurrency){
                leftAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            }
            .onChange(of: rightCurrency){
                rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            }
            .onChange(of: rightAmount) {
                if rightTyping {
                    leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
                }
            }
            .sheet(isPresented: $showSelectorCurreny) {
                SelectCurrenCy(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
            }
            //            .border(.blue)

            // Currency conversion section

            // Info Button
        }
    }
}

#Preview {
    ContentView()
}
