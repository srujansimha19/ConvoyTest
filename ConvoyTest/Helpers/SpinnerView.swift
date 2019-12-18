//
//  SpinnerView.swift
//  ConvoyTest
//
//  Created by Srujan Simha Adicharla on 12/18/19.
//  Copyright © 2019 Srujan Simha Adicharla. All rights reserved.
//

import UIKit

class SpinnerView: UIView {
    
    let activityIndicatorContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.widthAnchor.constraint(equalToConstant: 60).isActive = true
        view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        view.layer.cornerRadius = 16
        view.layer.shadowColor = UIColor.darkGray.cgColor
        view.layer.shadowRadius = 4
        
        return view
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView()
        ai.style = .white
        ai.startAnimating()
        return ai
    }()
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
        
        addSubview(activityIndicatorContainerView)
        activityIndicatorContainerView.addSubview(activityIndicator)
        
        activityIndicatorContainerView.center(in: self)
        activityIndicator.center(in: activityIndicatorContainerView)
    }
    
    static func start() {
        DispatchQueue.main.async {
            if let window = UIApplication.shared.keyWindow {
                let spinner = SpinnerView()
                spinner.alpha = 0
                window.addSubview(spinner)
                spinner.center(in: window)
                spinner.layer.zPosition = 1
                UIView.animate(withDuration: 0.3) {
                    spinner.alpha = 1
                }
            }
        }
    }
    
    static func stop() {
        if let window = UIApplication.shared.keyWindow {
            if let spinner = window.subviews.first(where: { (view) -> Bool in
                return view.isKind(of: SpinnerView.self)
            }) {
                UIView.animate(withDuration: 0.3, animations: {
                    spinner.alpha = 0
                }, completion: { (_) in
                    spinner.removeFromSuperview()
                })
            }
        }
    }
}
