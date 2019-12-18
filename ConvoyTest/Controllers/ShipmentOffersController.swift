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
    
    var requestedIndex: Int? {
        didSet {
            tableView.reloadData()
        }
    }
    
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

//MARK:- UICollectionView delegate and datasource methods
extension ShipmentOffersController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.offers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? ShipmentOfferCell else {
            return UITableViewCell()
        }
        
        cell.vm = vm.offers[indexPath.row]
        cell.isRequested = (requestedIndex == indexPath.row)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if requestedIndex == indexPath.row {
            requestedIndex = nil
        } else {
            requestedIndex = indexPath.row
        }
    }
}
