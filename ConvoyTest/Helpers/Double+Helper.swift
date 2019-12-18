//
//  Double+Helper.swift
//  ConvoyTest
//
//  Created by Srujan Simha Adicharla on 12/17/19.
//  Copyright © 2019 Srujan Simha Adicharla. All rights reserved.
//

import Foundation

public extension Double {
    func toCurrency() -> String? {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.numberStyle = .currency
        let currencyString = formatter.string(from: NSNumber(value:self))
        return currencyString
    }
}
