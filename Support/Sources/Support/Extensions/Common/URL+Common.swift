//
// URL+Common.swift
//

import Foundation

public extension URL {
    
    // MARK: -
    
    static var document: URL? {
        guard let searchPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else {
            return nil
        }
        let result = URL(string: searchPath)
#if targetEnvironment(macCatalyst)
        return result?.appendingPathComponent(.appName)
#else
        return result
#endif
    }
}
