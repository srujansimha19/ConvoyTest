//
//  ShipmentOfferCell.swift
//  ConvoyTest
//
//  Created by Srujan Simha Adicharla on 12/17/19.
//  Copyright © 2019 Srujan Simha Adicharla. All rights reserved.
//

import UIKit

class ShipmentOfferCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var milesLabel: UILabel!
    @IBOutlet weak var offerAmountLabel: UILabel!
    @IBOutlet weak var statusButton: UIButton!
    @IBOutlet weak var originCityLabel: UILabel!
    @IBOutlet weak var pickupTimeLabel: UILabel!
    @IBOutlet weak var destinationCityLabel: UILabel!
    @IBOutlet weak var dropoffTimeLabel: UILabel!
    
    @IBOutlet weak var originDotView: UIView!
    @IBOutlet weak var destinationDotView: UIView!
    @IBOutlet weak var originDotTopConstraint: NSLayoutConstraint!
    
    var isRequested: Bool = false {
        didSet {
            setStatus()
        }
    }
    
    var vm: ShipmentOfferViewModel? = nil {
        didSet {
            setDetails(vm: vm)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        selectionStyle = .none
        
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor(white: 0.9, alpha: 1).cgColor
        
        originDotView.layer.cornerRadius = 6
        destinationDotView.layer.cornerRadius = 6
    }

    
    private func setDetails(vm: ShipmentOfferViewModel?) {
        guard let vm = vm else {
            return
        }
        
        milesLabel.text = vm.milesText
        offerAmountLabel.text = vm.offerAmount
        
        originCityLabel.text = vm.originCity
        pickupTimeLabel.text = vm.pickupTime
        
        destinationCityLabel.text = vm.destinationCity
        dropoffTimeLabel.text = vm.dropoffTime
    }
    
    private func setStatus() {
        if isRequested {
            statusButton.isHidden = false
            originDotTopConstraint.priority = UILayoutPriority.defaultLow
        } else {
            statusButton.isHidden = true
            originDotTopConstraint.priority = UILayoutPriority(999)
        }
    }
}
