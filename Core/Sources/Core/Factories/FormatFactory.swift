//
// FormatFactory.swift
//

import Foundation

class FormatFactory {
    
    // MARK: -
    
    static func format(with url: URL) throws -> FormatProtocol {
        let pathExtension = url.pathExtension
        if pathExtension == PathExtension.dgc.rawValue {
            return DGCFormat(url: url)
        }
        if pathExtension == PathExtension.dcfb.rawValue {
            return DCFBFormat(url: url)
        }
        throw FormatFactoryError.invalidFileExtension
    }
}
