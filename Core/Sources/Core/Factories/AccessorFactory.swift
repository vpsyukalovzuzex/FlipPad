//
// AccessorFactory.swift
//

import Foundation

public final class AccessorFactory {
    
    // MARK: -
    
    public static func factory(with url: URL) throws -> AccessorProtocol {
        let pathExtension = url.pathExtension
        if pathExtension == PathExtension.dgc.rawValue {
            return DgcAccessor(url: url)
        }
        if pathExtension == PathExtension.dcfb.rawValue {
            return DcfbAccessor(url: url)
        }
        throw AccessorFactoryError.invalidFileExtension
    }
}
