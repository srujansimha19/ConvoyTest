//
//  Date+Utils.swift
//  ConvoyTest
//
//  Created by Srujan Simha Adicharla on 12/17/19.
//  Copyright © 2019 Srujan Simha Adicharla. All rights reserved.
//

import Foundation

func ===(lhs: Date?, rhs: Date?) -> Bool {
    if let lhsDate = lhs, let rhsDate = rhs {
        if Calendar.current.dateComponents([.day], from: lhsDate, to: rhsDate).day == 0 {
            return true
        }
    }
    
    return false
}
