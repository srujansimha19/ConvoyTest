//
//  ShipmentOfferListViewModel.swift
//  ConvoyTest
//
//  Created by Srujan Simha Adicharla on 12/17/19.
//  Copyright © 2019 Srujan Simha Adicharla. All rights reserved.
//

import Foundation

class ShipmentOfferListViewModel {
    var offers: [ShipmentOfferViewModel]
    var sortBy: OffersSortByOptions = .pickupDate {
        didSet {
            sortOffers()
        }
    }
    
    init() {
        self.offers = [ShipmentOfferViewModel]()
    }
    
    init(offers: [ShipmentOfferViewModel]) {
        self.offers = offers
    }
    
    private func sortOffers() {
        switch sortBy {
        case .pickupDate:
            self.offers = self.offers.sorted(by: { (first, second) -> Bool in
                guard let firstDate = first.pickupDate, let secondDate = second.pickupDate else {
                    return false
                }
                
                return firstDate < secondDate
            })
            
        case .dropoffDate:
            self.offers = self.offers.sorted(by: { (first, second) -> Bool in
                guard let firstDate = first.dropoffDate, let secondDate = second.dropoffDate else {
                    return false
                }
                
                return firstDate < secondDate
            })
            
        case .priceHighToLow:
            self.offers = self.offers.sorted(by: { (first, second) -> Bool in
                return first.price ?? 0 > second.price ?? 0
            })
            
        case .priceLowToHigh:
            self.offers = self.offers.sorted(by: { (first, second) -> Bool in
                return first.price ?? 0 < second.price ?? 0
            })
            
        case .origin:
            self.offers = self.offers.sorted(by: { (first, second) -> Bool in
                return first.originCity < second.originCity
            })
            
        case .destination:
            self.offers = self.offers.sorted(by: { (first, second) -> Bool in
                return first.destinationCity < second.destinationCity
            })
            
        case .milesNearestFirst:
            self.offers = self.offers.sorted(by: { (first, second) -> Bool in
                return (first.miles ?? 0) < (second.miles ?? 0)
            })
            
        case .milesFarthestFirst:
            self.offers = self.offers.sorted(by: { (first, second) -> Bool in
                return (first.miles ?? 0) > (second.miles ?? 0)
            })
        }
    }
}
