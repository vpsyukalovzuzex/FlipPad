//
// UIViewController+Common.swift
//

import UIKit

public extension UIViewController {
    
    // MARK: -
    
    func wrapInNavigationController() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
}
