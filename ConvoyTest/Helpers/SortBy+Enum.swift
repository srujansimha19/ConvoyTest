//
//  SortBy+Enum.swift
//  ConvoyTest
//
//  Created by Srujan Simha Adicharla on 12/18/19.
//  Copyright © 2019 Srujan Simha Adicharla. All rights reserved.
//

import Foundation


enum OffersSortByOptions {
    case pickupDate
    case dropoffDate
    case priceHighToLow
    case priceLowToHigh
    case origin
    case destination
    case milesNearestFirst
    case milesFarthestFirst
    
    var value: String {
        switch self {
        case .pickupDate:
            return "Pickup Date"
        case .dropoffDate:
            return "Dropoff Date"
        case .priceHighToLow:
            return "Price (highest to lowest)"
        case .priceLowToHigh:
            return "Price (lowest to highest)"
        case .origin:
            return "Origin"
        case .destination:
            return "Destination"
        case .milesNearestFirst:
            return "Miles (Nearest First)"
        case .milesFarthestFirst:
            return "Miles (Farthest First)"
        }
    }
    
    static var all: [String] {
        return [
            OffersSortByOptions.pickupDate.value,
            OffersSortByOptions.dropoffDate.value,
            OffersSortByOptions.priceHighToLow.value,
            OffersSortByOptions.priceLowToHigh.value,
            OffersSortByOptions.origin.value,
            OffersSortByOptions.destination.value,
            OffersSortByOptions.milesNearestFirst.value,
            OffersSortByOptions.milesFarthestFirst.value,
        ]
    }
    
    static func getOption(forValue value: String) -> OffersSortByOptions {
        switch value {
        case OffersSortByOptions.pickupDate.value:
            return .pickupDate
            
        case OffersSortByOptions.dropoffDate.value:
            return .dropoffDate
            
        case OffersSortByOptions.priceHighToLow.value:
            return .priceHighToLow
            
        case OffersSortByOptions.priceLowToHigh.value:
            return .priceLowToHigh
            
        case OffersSortByOptions.origin.value:
            return .origin
            
        case OffersSortByOptions.destination.value:
            return .destination
            
        case OffersSortByOptions.milesNearestFirst.value:
            return .milesNearestFirst
            
        case OffersSortByOptions.milesFarthestFirst.value:
            return .milesFarthestFirst
            
        default:
            return .pickupDate
        }
    }
}
