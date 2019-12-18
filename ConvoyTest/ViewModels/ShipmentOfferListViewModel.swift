//
//  ShipmentOfferListViewModel.swift
//  ConvoyTest
//
//  Created by Srujan Simha Adicharla on 12/17/19.
//  Copyright © 2019 Srujan Simha Adicharla. All rights reserved.
//

import Foundation

struct ShipmentOfferListViewModel {
    let offers: [ShipmentOfferViewModel]
    
    init() {
        self.offers = [ShipmentOfferViewModel]()
    }
    
    init(offers: [ShipmentOfferViewModel]) {
        self.offers = offers
    }
}
