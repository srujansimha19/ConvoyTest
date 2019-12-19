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
    
    var sortByBarButton = UIButton(type: .custom)
    var sendAlertsConfirmationView: SendAlertsConfirmationView?
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
        
        configureSortBarButton(with: .pickupDate)
        
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
    
    // Sort methods
    @objc private func didClickSortBy() {
        let options = OffersSortByOptions.all
        let alertController = UIAlertController(title: "Sort By", message: "Select an option to sort offers", preferredStyle: .actionSheet)
        
        for option in options {
            alertController.addAction(UIAlertAction(title: option, style: .default, handler: { (action) in
                if let title = action.title {
                    DispatchQueue.main.async {
                        let option = OffersSortByOptions.getOption(forValue: title)
                        self.configureSortBarButton(with: option)
                        self.vm.sortBy = option
                        self.tableView.reloadData()
                    }
                }
            }))
        }
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func configureSortBarButton(with option: OffersSortByOptions = .pickupDate) {
        let attrTitle = getSortAttributedTitle(for: option)
        sortByBarButton.setAttributedTitle(attrTitle, for: .normal)
        sortByBarButton.layer.borderColor = UIColor.convoyGray.cgColor
        sortByBarButton.layer.borderWidth = 1
        sortByBarButton.layer.cornerRadius = 4
        sortByBarButton.addTarget(self, action: #selector(didClickSortBy), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: sortByBarButton)
    }
    
    private func getSortAttributedTitle(for option: OffersSortByOptions) -> NSAttributedString {
        let attrTitle = NSMutableAttributedString(string: "  Sort by", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor : UIColor.convoyGray])
        attrTitle.append(NSAttributedString(string: ": " + option.value + "  ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor : UIColor.convoyGray]))
        
        return attrTitle
    }
    
    // Request confirmation methods
    private func showConfirmationView() {
        let views = UINib(nibName: "SendAlertsConfirmationView", bundle: Bundle.main).instantiate(withOwner: nil, options: nil)
        if !views.isEmpty, let sendAlertsConfirmationView = views.first as? SendAlertsConfirmationView, let window = UIApplication.shared.keyWindow {
            sendAlertsConfirmationView.translatesAutoresizingMaskIntoConstraints = false
            sendAlertsConfirmationView.delegate = self
            window.addSubview(sendAlertsConfirmationView)
            NSLayoutConstraint.activate([
                sendAlertsConfirmationView.leadingAnchor.constraint(equalTo: window.leadingAnchor, constant: 0),
                sendAlertsConfirmationView.trailingAnchor.constraint(equalTo: window.trailingAnchor, constant: 0),
                sendAlertsConfirmationView.bottomAnchor.constraint(equalTo: window.bottomAnchor, constant: 0),
                sendAlertsConfirmationView.topAnchor.constraint(equalTo: window.topAnchor, constant: 0),
                ])
        }
    }
}

//MARK:- UITableView delegate and datasource methods
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
            sendAlertsConfirmationView?.removeFromSuperview()
        } else {
            showConfirmationView()
            requestedIndex = indexPath.row
        }
    }
}


extension ShipmentOffersController: SendAlertsConfirmationDelegate {
    func sendAlerts() {
        if let window = UIApplication.shared.keyWindow {
            let confirmView = SendAlertsSuccessView(frame: window.frame)
            confirmView.backgroundColor = .white
            window.addSubview(confirmView)
            
            confirmView.frame.origin.y = UIScreen.main.bounds.height
            UIView.animate(withDuration: 0.35, delay: 0, options: .curveEaseInOut, animations: {
                confirmView.frame.origin.y = 0
            }, completion: nil)
        }
    }
    
    func doNotSendAlerts() {
        requestedIndex = nil
    }
}
