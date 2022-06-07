//
// String+Common.swift
//

import Foundation

extension String {
    
    // MARK: -
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
