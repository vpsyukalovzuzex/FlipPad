//
// String+Common.swift
//

import Foundation

public extension String {
    
    // MARK: -
    
    static var appName: String {
        return Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
    }
    
    // MARK: -
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
