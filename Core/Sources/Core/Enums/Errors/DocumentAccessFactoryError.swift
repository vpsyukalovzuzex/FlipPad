//
// AccessorFactoryError.swift
//

import Foundation
import Support

enum DocumentAccessFactoryError: CustomNSError {
    
    // MARK: -
    
    case invalidFileExtension
    
    // MARK: -
    
    static var errorDomain: String {
        return .coreErrorDomain
    }
    
    // MARK: -
    
    var errorCode: Int {
        switch self {
        case .invalidFileExtension:
            return 0
        }
    }
    
    var errorUserInfo: [String : Any] {
        let localizedDescription: String
        switch self {
        case .invalidFileExtension:
            localizedDescription = "Invalid file extension"
        }
        return [
            NSLocalizedDescriptionKey : localizedDescription.localized
        ]
    }
}
