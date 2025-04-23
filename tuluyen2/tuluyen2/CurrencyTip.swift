//
//  CurrencyTip.swift
//  tuluyen2
//
//  Created by TuanAnh on 13/3/25.
//
import TipKit
struct CurrencyTip : Tip{
    var title = Text("Change Currency")
    var message: Text? = Text("U can tap the left or right currency to bring up The Select Currency View")
    var image: Image? = Image(systemName: "hand.tap")
}
