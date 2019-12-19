//
//  SendAlertsConfirmationView.swift
//  ConvoyTest
//
//  Created by Srujan Simha Adicharla on 12/18/19.
//  Copyright © 2019 Srujan Simha Adicharla. All rights reserved.
//

import UIKit

protocol SendAlertsConfirmationDelegate: class {
    func sendAlerts()
    func doNotSendAlerts()
}

class SendAlertsConfirmationView: UIView {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var noButtonBottomConstraint: NSLayoutConstraint!
    
    weak var delegate: SendAlertsConfirmationDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        yesButton.layer.cornerRadius = yesButton.frame.height / 2
        noButton.layer.cornerRadius = noButton.frame.height / 2
        noButton.layer.borderColor = UIColor.convoyOrange.cgColor
        noButton.layer.borderWidth = 1

        yesButton.addTarget(self, action: #selector(didClickYesButton), for: .touchUpInside)
        noButton.addTarget(self, action: #selector(didClickNoButton), for: .touchUpInside)
        
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width: 0, height: -5)
        containerView.layer.shadowRadius = 5
        containerView.layer.shadowOpacity = 0.1
        
        containerView.frame.origin.y = UIScreen.main.bounds.height
        UIView.animate(withDuration: 0.35, delay: 0, options: .curveEaseInOut, animations: {
            self.containerView.frame.origin.y = UIScreen.main.bounds.height - self.containerView.frame.height
        }, completion: nil)
        
        noButtonBottomConstraint.constant = (UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0) + 20
    }
    
    @objc func didClickYesButton() {
        delegate?.sendAlerts()
        dismissView()
    }
    
    @objc func didClickNoButton() {
        delegate?.doNotSendAlerts()
        dismissView()
    }
    
    func dismissView() {
        UIView.animate(withDuration: 0.35, delay: 0, options: .curveEaseInOut, animations: {
            self.containerView.frame.origin.y = UIScreen.main.bounds.height
        }, completion: { _ in
            self.removeFromSuperview()
        })
    }
}
