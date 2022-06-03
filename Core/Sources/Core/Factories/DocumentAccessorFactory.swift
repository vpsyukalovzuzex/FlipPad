//
// DocumentAccessorFactory.swift
//

import Foundation

class DocumentAccessorFactory {
    
    // MARK: -
    
    static func documentAccessor(with url: URL) throws -> DocumentAccessorProtocol {
        let pathExtension = url.pathExtension
        if pathExtension == FileExtension.dgc.rawValue {
            return DGCDocumentAccessor(url: url)
        }
        if pathExtension == FileExtension.dcfb.rawValue {
            return DCFBDocumentAccessor(url: url)
        }
        throw DocumentAccessFactoryError.invalidFileExtension
    }
}
