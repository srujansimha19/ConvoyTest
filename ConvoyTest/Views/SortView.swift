//
//  SortView.swift
//  ConvoyTest
//
//  Created by Srujan Simha Adicharla on 12/19/19.
//  Copyright © 2019 Srujan Simha Adicharla. All rights reserved.
//

import UIKit

protocol SortViewDelegate: class {
    func sortButtonTapped()
}

class SortView: UIView {
    
    @IBOutlet weak var sortButton: UIButton!
    @IBOutlet weak var bestMatchesLabel: UILabel!
    
    weak var delegate: SortViewDelegate?
    
    var sortOption: OffersSortByOptions = .pickupDate {
        didSet {
            updateSortButtonTitle()
        }
    }
    
    var matchedCount: Int = 0 {
        didSet {
            bestMatchesLabel.text = matchedCount.string
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bestMatchesLabel.layer.cornerRadius = 10
        
        sortButton.layer.cornerRadius = 4
        sortButton.layer.borderColor = UIColor.convoyGray.cgColor
        sortButton.layer.borderWidth = 1
        sortButton.addTarget(self, action: #selector(didClickSortButton), for: .touchUpInside)
    }
    
    private func updateSortButtonTitle() {
        let attrTitle = NSMutableAttributedString(string: "  Sort by", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor : UIColor.convoyGray])
        attrTitle.append(NSAttributedString(string: ": " + sortOption.value + "  ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor : UIColor.convoyGray]))
        
        sortButton.setAttributedTitle(attrTitle, for: .normal)
    }
    
    private func updateMatchedCountLabel() {
        let attrTitle = NSMutableAttributedString(string: "BEST MATCHES ", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor : UIColor.convoyGray])
        attrTitle.append(NSAttributedString(string: " 3 ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor : UIColor.convoyGray]))
    }
    
    @objc private func didClickSortButton() {
        delegate?.sortButtonTapped()
    }
}
