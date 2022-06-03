//
// UIColor+Common.swift
//

import UIKit

public extension UIColor {
    
    // MARK: -
    
    var color: Color {
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 0.0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        return Color(
            r: Int(255.0 * r),
            g: Int(255.0 * g),
            b: Int(255.0 * b),
            a: Int(255.0 * a)
        )
    }
}
