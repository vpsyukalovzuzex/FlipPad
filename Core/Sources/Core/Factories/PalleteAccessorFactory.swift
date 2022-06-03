//
// PalleteAccessorFactory.swift
//

import Foundation

class PalleteAccessorFactory {
    
    // MARK: -
    
    static func palleteAccessor(with url: URL) throws -> PalleteAccessorProtocol {
        let pathExtension = url.pathExtension
        if pathExtension == FileExtension.dgcplt.rawValue {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(DGCPLTPalleteAccessor.self, from: data)
        }
        throw PalleteAccessorFactoryError.invalidPalleteExtension
    }
}
