//
//  UIView+TabataTimer.swift
//  TabataTimer
//
//  Created by Иван Савин on 04.05.2020.
//  Copyright © 2020 Иван Савин. All rights reserved.
//

import UIKit

//MARK: Subview

extension UIView {
    
    func addSubviews(subviews: UIView ...) {
        subviews.forEach {
            addSubview($0)
        }
    }
    
}

//MARK: Anchor

extension UIView {
    
    func setSizeAnchor(size: CGSize) {
        setAnchors(width: size.width, height: size.height)
    }
    
    func fillInSuperview() {
        guard let superview = self.superview else { fatalError("Can't obtain superview") }
        setAnchors(top: superview.topAnchor, bottom: superview.bottomAnchor, leading: superview.leadingAnchor, trailing: superview.trailingAnchor)
    }
    
    func setCenterAnchor(centerX: NSLayoutXAxisAnchor? = nil, centerXMultiplier: CGFloat = 1, centerY: NSLayoutYAxisAnchor? = nil, centerYMultiplier: CGFloat = 1) {
        translatesAutoresizingMaskIntoConstraints = false
        if let centerX = centerX {
            centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        if let centerY = centerY {
            centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
    }
    
    func setAnchors(top: NSLayoutYAxisAnchor? = nil,
                    topPadding: CGFloat = 0.0,
                    bottom: NSLayoutYAxisAnchor? = nil,
                    bottomPadding: CGFloat = 0.0,
                    leading: NSLayoutXAxisAnchor? = nil,
                    leadingPadding: CGFloat = 0.0,
                    trailing: NSLayoutXAxisAnchor? = nil,
                    trailingPadding: CGFloat = 0.0,
                    width: CGFloat? = nil,
                    height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: topPadding).isActive = true
        }
        if let bottom = bottom {
            bottom.constraint(equalTo: bottomAnchor, constant: bottomPadding).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: leadingPadding).isActive = true
        }
        if let trailing = trailing {
            trailing.constraint(equalTo: trailingAnchor, constant: trailingPadding).isActive = true
        }
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
}
