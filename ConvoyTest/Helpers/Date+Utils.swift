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

extension Date {
    func getDate(fromString dateString:String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return dateFormatter.date(from: dateString)
    }
}
