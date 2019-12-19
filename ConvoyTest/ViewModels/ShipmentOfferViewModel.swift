//
//  ShipmentOfferViewModel.swift
//  ConvoyTest
//
//  Created by Srujan Simha Adicharla on 12/17/19.
//  Copyright © 2019 Srujan Simha Adicharla. All rights reserved.
//

import UIKit

struct ShipmentOfferViewModel: Codable {
    private var shipmentOffer: ShipmentOffer?
}

extension ShipmentOfferViewModel {
    
    init(from decoder: Decoder) throws {
        self.shipmentOffer = try? ShipmentOffer(from: decoder)
    }
    
    func encode(to encoder: Encoder) throws {
    }
}

extension ShipmentOfferViewModel {
    
    var miles: Int? {
        return self.shipmentOffer?.miles
    }
    
    var milesText: String {
        if let miles = self.shipmentOffer?.miles {
            return miles.toMilesString
        }
        
        return "n/a"
    }
    
    var price: Double? {
        return self.shipmentOffer?.offer
    }
    var offerAmount: String {
        if let offer = self.shipmentOffer?.offer?.toCurrency() {
            return offer
        }
        
        return "n/a"
    }
    
    var originCity: String {
        var cityString: String = ""
        if let city = self.shipmentOffer?.origin?.city {
            cityString = city
        }
        
        if let state = self.shipmentOffer?.origin?.state {
            cityString = cityString.isEmpty ? state : (cityString + ", " + state)
        }
        
        return cityString
    }
    
    var destinationCity: String {
        var cityString: String = ""
        if let city = self.shipmentOffer?.destination?.city {
            cityString = city
        }
        
        if let state = self.shipmentOffer?.destination?.state {
            cityString = cityString.isEmpty ? state : (cityString + ", " + state)
        }
        
        return cityString
    }
    
    var pickupDate: Date? {
        guard let pickupStartTime = shipmentOffer?.origin?.pickup?.startTime else {
            return nil
        }
        
        return Date().getDate(fromString: pickupStartTime)
    }
    
    var dropoffDate: Date? {
        guard let dropoffStartTime = shipmentOffer?.origin?.dropoff?.startTime else {
            return nil
        }
        
        return Date().getDate(fromString: dropoffStartTime)
    }
    
    var pickupTime: String {
        var time: String = ""
        guard let pickup = shipmentOffer?.origin?.pickup else {
            return "n/a - n/a"
        }
        
        if let startTime = pickup.startTime {
            time = startTime.toDateString(inFormat: "E MM/dd hh:mm a")
        } else {
            time = "n/a"
        }
        
        if let endTime = pickup.endTime {
            let startDate = pickup.startTime?.toDate()
            let endDate = endTime.toDate()
            
            if startDate === endDate {
                time += (" - " + endTime.toDateString(inFormat: "hh:mm a"))
            } else {
                time += (" - " + endTime.toDateString(inFormat: "E MM/dd hh:mm a"))
            }
        } else {
            time += "n/a"
        }
        
        return time
    }
    
    var dropoffTime: String {
        var time: String = ""
        guard let dropoff = shipmentOffer?.destination?.dropoff else {
            return "n/a - n/a"
        }
        
        if let startTime = dropoff.startTime {
            time = startTime.toDateString(inFormat: "E MM/dd hh:mm a")
        } else {
            time = "n/a"
        }
        
        if let endTime = dropoff.endTime {
            let startDate = dropoff.startTime?.toDate()
            let endDate = endTime.toDate()
            
            if startDate === endDate {
                time += (" - " + endTime.toDateString(inFormat: "hh:mm a"))
            } else {
                time += (" - " + endTime.toDateString(inFormat: "E MM/dd hh:mm a"))
            }
        } else {
            time += "n/a"
        }
        
        return time
    }
}
