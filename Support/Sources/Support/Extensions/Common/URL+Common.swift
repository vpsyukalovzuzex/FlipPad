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
        return URL(string: searchPath)?
            .appendingPathComponent(.appName)
    }
    
    static var cache: URL? {
        guard let searchPath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first else {
            return nil
        }
        return URL(string: searchPath)?
            .appendingPathComponent(.appName)
            .appendingPathComponent(.thumbnails)
    }
}
