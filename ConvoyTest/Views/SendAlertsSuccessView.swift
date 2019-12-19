//
//  SendAlertsSuccessView.swift
//  ConvoyTest
//
//  Created by Srujan Simha Adicharla on 12/18/19.
//  Copyright © 2019 Srujan Simha Adicharla. All rights reserved.
//

import UIKit

class SendAlertsSuccessView: UIView {

    override func draw(_ rect: CGRect) {
        setupCheckmark()
        addDescriptionLabel()
        addCloseButton()
    }
    
    var animationLayer = CALayer()
    var shapeLayer = CAShapeLayer()
    
    private func setupCheckmark() {
        
        let x: CGFloat = self.frame.midX - 28
        let y: CGFloat = self.frame.height / 4
        let width: CGFloat = 56
        let height: CGFloat = 56
        
        let path = UIBezierPath(ovalIn: CGRect(x: x,
                                               y: y,
                                               width: width,
                                               height: height))
        UIColor.convoyGreen.setFill()
        path.fill()
        
        let startPoint = CGPoint(x: x + (width * 0.25), y: y + (height * 0.55))
        let controlPoint = CGPoint(x: x + (width * 0.42), y: y + (height * 0.68))
        let endPoint = CGPoint(x: x + (width * 0.72), y: y + (height * 0.3))
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: startPoint)
        bezierPath.addLine(to: controlPoint)
        bezierPath.addLine(to: endPoint)
        bezierPath.lineWidth = 3
        
        UIColor.white.setStroke()
        bezierPath.stroke()
    }
    
    private func addDescriptionLabel() {
        let label = UILabel(frame: CGRect(x: 40, y: (self.frame.height / 4) + 56, width: self.frame.width - 80, height: 100))
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = UIColor.convoyBlack
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Great! Sending you lane notifications to help keep your foot on the pedal."
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        addSubview(label)
        
    }
    
    private func addCloseButton() {
        let closeButton = UIButton(frame: CGRect(x: frame.self.width - 50, y: (UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0) + 30, width: 20, height: 20))
        closeButton.setTitle("X", for: .normal)
        closeButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        closeButton.setTitleColor(UIColor.convoyGray, for: .normal)
        closeButton.addTarget(self, action: #selector(closeView), for: .touchUpInside)
        addSubview(closeButton)
    }
    
    @objc func closeView() {
        UIView.animate(withDuration: 0.35, delay: 0, options: .curveEaseInOut, animations: {
            self.frame.origin.y = UIScreen.main.bounds.height
        }) { (_) in
            self.removeFromSuperview()
        }
    }
}
