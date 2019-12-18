//
//  ShipmentOffer.swift
//  ConvoyTest
//
//  Created by Srujan Simha Adicharla on 12/16/19.
//  Copyright © 2019 Srujan Simha Adicharla. All rights reserved.
//

import UIKit

struct ShipmentOffer: Codable {
    let miles: Int?
    let offer: Double?
    let origin: ShipmentLocation?
    let destination: ShipmentLocation?
}

extension ShipmentOffer {
    
    private enum CodingKeys: String, CodingKey {
        case miles
        case origin
        case offer
        case destination
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.miles = try container.decodeIfPresent(Int.self, forKey: .miles)
        self.offer = try container.decodeIfPresent(Double.self, forKey: .offer)
        self.origin = try container.decodeIfPresent(ShipmentLocation.self, forKey: .origin)
        self.destination = try container.decodeIfPresent(ShipmentLocation.self, forKey: .destination)
    }
    
    func encode(to encoder: Encoder) throws {
        
    }
}


struct ShipmentLocation: Codable {
    var city, state: String?
    var pickup: ShipmentTime?
    var dropoff: ShipmentTime?
}

extension ShipmentLocation {
    
    enum CodingKeys: String, CodingKey {
        case city, state, pickup, dropoff
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.city = try container.decodeIfPresent(String.self, forKey: .city)
        self.state = try container.decodeIfPresent(String.self, forKey: .state)
        self.pickup = try container.decodeIfPresent(ShipmentTime.self, forKey: .pickup)
        self.dropoff = try container.decodeIfPresent(ShipmentTime.self, forKey: .dropoff)
    }
    
    func encode(to encoder: Encoder) throws {
        
    }
}


struct ShipmentTime: Codable {
    var startTime: String?
    var endTime: String?
}

extension ShipmentTime {
    
    enum CodingKeys: String, CodingKey {
        case start, end
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.startTime = try container.decodeIfPresent(String.self, forKey: .start)
        self.endTime = try container.decodeIfPresent(String.self, forKey: .end)
    }
    
    func encode(to encoder: Encoder) throws {
        
    }
}
