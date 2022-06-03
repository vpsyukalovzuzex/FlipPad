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

extension CGSize {
    
    static var newSceneViewPreferredContentSize: CGSize {
        return CGSize(
            width: 228.0,
            height: 406.0
        )
    }
    
    static var settingsViewPreferredContentSize: CGSize {
        return CGSize(
            width: 356.0,
            height: 182.0
        )
    }
    
    static var palletesViewPreferredContentSize: CGSize {
        return CGSize(
            width: 228.0,
            height: 406.0
        )
    }
    
    static var lightboxSettingsViewPreferredContentSize: CGSize {
        return CGSize(
            width: 356.0,
            height: 292.0
        )
    }
}
