//
// UIView+Common.swift
//

import UIKit

extension UIView {
    
    // MARK: -
    
    func setCornerRadius(_ cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
}
