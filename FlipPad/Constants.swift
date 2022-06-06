//
// Constants.swift
//

import UIKit

extension Bool {
    
    // MARK: -
    
    static var isPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    
    static var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    static var isMacCatalyst: Bool {
#if targetEnvironment(macCatalyst)
        return true
#else
        return false
#endif
    }
}

extension CGFloat {
    
    // MARK: -
    
    static var iOSBrowserTopInset: CGFloat {
        return 52.0
    }
    
    static var phoneBrowserItemSize: CGFloat {
        return 148.0
    }
    
    static var padBrowserItemSize: CGFloat {
        return 158.0
    }
}
