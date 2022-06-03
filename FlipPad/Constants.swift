//
// Constants.swift
//

import Foundation

extension Bool {
    
    // MARK: -
    
    static var isMacCatalyst: Bool {
#if targetEnvironment(macCatalyst)
        return true
#else
        return false
#endif
    }
}
