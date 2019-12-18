//
//  Int+Helper.swift
//  ConvoyTest
//
//  Created by Srujan Simha Adicharla on 12/17/19.
//  Copyright © 2019 Srujan Simha Adicharla. All rights reserved.
//

import Foundation

public extension Int {
    var string: String {
        get {
            return "\(self)"
        }
    }
    
    var toMilesString: String {
        get {
            let formattedInt = String(format: "%d", locale: Locale.current, self)
            if self == 1 {
                return formattedInt + " mile"
            } else {
                return formattedInt + " miles"
            }
        }
    }
}
