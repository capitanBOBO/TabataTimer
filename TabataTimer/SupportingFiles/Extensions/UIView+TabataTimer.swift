//
//  UIView+TabataTimer.swift
//  TabataTimer
//
//  Created by Иван Савин on 04.05.2020.
//  Copyright © 2020 Иван Савин. All rights reserved.
//

import UIKit

//MARK: Appearence UIView

extension UIView {
    
    func rounded<T: UIView>(_ cornerRadius: CGFloat) -> T! {
        guard let v = self as? T else { assertionFailure("Incorrect type"); return nil }
        v.clipsToBounds = true
        v.layer.cornerRadius = cornerRadius
        return v
    }
    
    func bordered<T: UIView>(_ width: CGFloat, color: UIColor) -> T! {
        guard let v = self as? T else { assertionFailure("Incorrect type"); return nil }
        v.layer.borderWidth = width
        v.layer.borderColor = color.cgColor
        return v
    }
    
}

//MARK: Appearence UIButton

extension UIButton {
    
    /// Default rounded and bordered button
    /// - Parameters:
    ///   - title: Button title
    ///   - image: Button image
    ///   - state: Button state, .normal by default
    /// - Returns: Default rounded and bordered button
    static func defaultButton(title: String? = nil, image: UIImage? = nil) -> UIButton {
        let v: UIButton = UIButton().rounded(15).bordered(2, color: .defaultButtonCollor)
        v.setTitleColor(.defaultButtonCollor, for: .normal)
        v.tintColor = .defaultButtonCollor
        v.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        v.setTitle(title, for: .normal)
        v.setImage(image, for: .normal)
        return v
    }
    
}

//MARK: Subview

extension UIView {
    
    func addSubviews(_ subviews: UIView ...) {
        subviews.forEach {
            addSubview($0)
        }
    }
    
}

//MARK: Anchor

extension UIView {
    
    
    /// Set width and height anchors to constat size
    /// - Parameter size: Width and height constant sizes CGSize
    func setSizeAnchor(size: CGSize) {
        setAnchors(widthConstant: size.width, heightConstant: size.height)
    }
    
    /// Set top, bottom, leading and trailing anchors to superview anchors
    func fillInSuperview() {
        guard let superview = self.superview else { fatalError("Can't obtain superview") }
        setAnchors(top: superview.topAnchor, bottom: superview.bottomAnchor, leading: superview.leadingAnchor, trailing: superview.trailingAnchor)
    }
    
    /// Center anchors. If parameters equal to nil then will be set to superview center anchors
    /// - Parameters:
    ///   - centerX: centerX anchor NSLayoutXAxisAnchor
    ///   - centerY: centerY anchor NSLayoutYAxisAnchor
    func setCenterAnchor(centerX: NSLayoutXAxisAnchor? = nil, centerY: NSLayoutYAxisAnchor? = nil) {
        translatesAutoresizingMaskIntoConstraints = false
        if centerX == nil, centerY == nil {
            guard let superview = self.superview else { return }
            centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
            centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
        } else {
            if let centerX = centerX {
                centerXAnchor.constraint(equalTo: centerX).isActive = true
            }
            if let centerY = centerY {
                centerYAnchor.constraint(equalTo: centerY).isActive = true
            }
        }
    }
    
    /// Required anchors for view
    func setAnchors(top: NSLayoutYAxisAnchor? = nil,
                    topPadding: CGFloat = 0.0,
                    bottom: NSLayoutYAxisAnchor? = nil,
                    bottomPadding: CGFloat = 0.0,
                    leading: NSLayoutXAxisAnchor? = nil,
                    leadingPadding: CGFloat = 0.0,
                    trailing: NSLayoutXAxisAnchor? = nil,
                    trailingPadding: CGFloat = 0.0,
                    widthAnchor: NSLayoutDimension? = nil,
                    widthMultipler: CGFloat = 1,
                    heightAnchor: NSLayoutDimension? = nil,
                    heightMultipler: CGFloat = 1,
                    widthConstant: CGFloat? = nil,
                    heightConstant: CGFloat? = nil) {
        
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
        if let width = widthConstant {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = heightConstant {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if let widthAnchor = widthAnchor {
            self.widthAnchor.constraint(equalTo: widthAnchor, multiplier: widthMultipler).isActive = true
        }
        if let heightAnchor = heightAnchor {
            self.heightAnchor.constraint(equalTo: heightAnchor, multiplier: heightMultipler).isActive = true
        }
    }
    
}
