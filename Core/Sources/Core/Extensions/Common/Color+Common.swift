//
// Color+Common.swift
//

import UIKit

public extension Color {
    
    // MARK: -
    
    var uiColor: UIColor {
        let rgba = unitSegments
        return UIColor(
            red: CGFloat(rgba.r),
            green: CGFloat(rgba.g),
            blue: CGFloat(rgba.b),
            alpha: CGFloat(rgba.a)
        )
    }
}
