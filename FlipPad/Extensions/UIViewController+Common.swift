//
// UIViewController+Common.swift
//

import UIKit

extension UIViewController {
    
    // MARK: -
    
    static func instantiate() -> Self {
        return UIStoryboard(name: String(describing: self), bundle: nil).instantiateInitialViewController() as! Self
    }
    
    // MARK: -
    
#if targetEnvironment(macCatalyst)
    
    var macCatalystTitlebar: UITitlebar? {
        return (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.titlebar
    }
    
    var macCatalystToolbar: NSToolbar? {
        get {
            return macCatalystTitlebar?.toolbar
        }
        set {
            macCatalystTitlebar?.toolbar = newValue
        }
    }
    
#endif
    
    // MARK: -
    
    func wrapInNavigationControllerIfNeeded() -> UIViewController {
        let isNeedNavigationController: Bool = .isPhone && !.isMacCatalyst
        return isNeedNavigationController ? wrapInNavigationController() : self
    }
}
