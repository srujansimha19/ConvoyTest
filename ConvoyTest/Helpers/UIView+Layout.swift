//
//  UIView+Layout.swift
//  ConvoyTest
//
//  Created by Srujan Simha Adicharla on 12/18/19.
//  Copyright © 2019 Srujan Simha Adicharla. All rights reserved.
//

import UIKit

extension UIView {
    
    func center(in view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
    }
}
