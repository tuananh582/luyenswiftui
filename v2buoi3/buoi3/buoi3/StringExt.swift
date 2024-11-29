//
//  StringExt.swift
//  buoi3
//
//  Created by TuanAnh on 29/11/24.
//

import Foundation
extension String{
    func removeSpaces()->String{
        self.replacingOccurrences(of: " ", with: "")
    }
    func removeCaseAndSpace()->String{
        self.removeSpaces().lowercased()
    }
}
