//
//  ShipmentOfferManager.swift
//  ConvoyTest
//
//  Created by Srujan Simha Adicharla on 12/17/19.
//  Copyright © 2019 Srujan Simha Adicharla. All rights reserved.
//

import Foundation
import UIKit

class ShipmentOfferManager {
    
    public init() { }
    
    public func getOffers(completion: @escaping (_ vm: ShipmentOfferListViewModel?, _ error: NetworkError?) -> ()) {
        
        guard let url = URL(string: "https://convoy-mock-api.herokuapp.com/offers") else {
            completion(nil, .urlError)
            return
        }
        
        let shipmentOffersResource = Resource<[ShipmentOfferViewModel]>(url: url)
        
        Webservice().load(resource: shipmentOffersResource) { (result) in
            
            switch result {
            case .success(let data):
                completion(ShipmentOfferListViewModel(offers: data), nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
