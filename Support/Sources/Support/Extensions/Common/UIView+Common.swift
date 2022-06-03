//
// UIView+Common.swift
//

import UIKit

public extension UIView {
    
    // MARK: -
    
    func setCornerRadius(_ cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
    
    func setShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowRadius = 1.6
        layer.shadowOpacity = 0.8
        layer.masksToBounds = false
    }
    
    func setStroke() {
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 0.5
    }
}
