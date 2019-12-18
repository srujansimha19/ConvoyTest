//
//  ShipmentOffersController.swift
//  ConvoyTest
//
//  Created by Srujan Simha Adicharla on 12/17/19.
//  Copyright © 2019 Srujan Simha Adicharla. All rights reserved.
//

import UIKit

class ShipmentOffersController: BaseListController {
    
    fileprivate let cellId = "ShipmentOfferDetails"
    
    var vm = ShipmentOfferListViewModel() {
        didSet {
            tableView.reloadData()
        }
    }
    
    //MARK: - Fetch data and configure view
    override func configureView() {
        
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        tableView.register(ShipmentOfferCell.self, forCellReuseIdentifier: cellId)
        tableView.register(UINib(nibName: "ShipmentOfferCell", bundle: Bundle.main), forCellReuseIdentifier: cellId)
        
        ShipmentOfferManager().getOffers() { [weak self] (vm, error) in
            guard let strongSelf = self else {
                return
            }
            
            if let vm = vm {
                strongSelf.vm = vm
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}
