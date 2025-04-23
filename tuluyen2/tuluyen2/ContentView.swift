//
//  ContentView.swift
//  tuluyen2
//
//  Created by TuanAnh on 12/3/25.
//

import SwiftUI
import TipKit
struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    @State var leftAmount = ""
    @State var rightAmount = ""
    @State var leftCurrency : Currency = .silverPiece
    @State var rightCurrency : Currency = .goldPiece
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    let currencyTip = CurrencyTip()
    
    
    
    var body: some View {
        ZStack {
            // Background Image
            Image(.background).resizable().ignoresSafeArea()
            
            VStack {
                // Prancing pony image
                Image(.prancingpony).resizable().scaledToFit().frame(height: 200)
                
                // Currency exchange text
                Text("Currency Exchange").font(.largeTitle).foregroundStyle(.white)
                
                // Conversion section
                
                HStack {
                    // Left conversion section
                    
                    VStack {
                        // Currency
                        
                        HStack {
                            // Currency Image
                            Image(leftCurrency.image).resizable().scaledToFit().frame(height: 33)
                            
                            // Currency Text
                            Text(leftCurrency.name).font(.headline).foregroundStyle(.white)
                        }.padding(.bottom, -5).onTapGesture {
                            showSelectCurrency.toggle()
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        .popoverTip(currencyTip,arrowEdge: .bottom)
                        
                        // Text Field
                        TextField("Amount", text: $leftAmount).textFieldStyle(.roundedBorder).focused($leftTyping)
                    }
                    
                    
                    // Equal Sign
                    Image(systemName: "equal").font(.largeTitle).foregroundStyle(.white).symbolEffect(.pulse)
                    
                    // Right Conversion Section
                    VStack {
                        // Currency
                        
                        HStack {
                            // Currency Text
                            Text(rightCurrency.name).font(.headline).foregroundStyle(.white)
                            
                            // Currency Image
                            Image(rightCurrency.image).resizable().scaledToFit().frame(height: 33)
                        }.padding(.bottom, -5).onTapGesture {
                            showSelectCurrency.toggle()
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        TextField("Amount", text: $rightAmount).textFieldStyle(.roundedBorder).multilineTextAlignment(.trailing).focused($rightTyping)
                    }
                }
                .padding()
                .background(.black.opacity(0.5)).clipShape(.capsule)
                .keyboardType(.decimalPad)
                Spacer()
                // Info Button
                HStack {
                    Spacer()
                    
                    Button {
                        showExchangeInfo.toggle()
                        print("Show Exchange Infor \(showExchangeInfo)")
                    } label: {
                        Image(systemName: "info.circle.fill").font(.largeTitle).foregroundStyle(.white)
                    }
                    .padding(.trailing)
                    .sheet(isPresented: $showExchangeInfo) {
                        ExchangeInfo()
                    }
                    .task {
                        try?Tips.configure()
                    }
                    
                    .onChange(of:rightAmount){
                        if rightTyping{
                            leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
                        }
                    }
                    .onChange(of:leftAmount){
                        if leftTyping {
                            rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
                        }
                        
                    } // binding String
                    .sheet(isPresented: $showSelectCurrency) {
                        SelectCurrency(TopCurrency: $leftCurrency, BottomCurrency: $rightCurrency)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
