//
// PalleteAccessorFactoryError.swift
//

import Foundation
import Support

enum PalleteAccessorFactoryError: CustomNSError {
    
    // MARK: -
    
    case invalidPalleteExtension
    
    // MARK: -
    
    static var errorDomain: String {
        return .coreErrorDomain
    }
    
    // MARK: -
    
    var errorCode: Int {
        switch self {
        case .invalidPalleteExtension:
            return 0
        }
    }
    
    var errorUserInfo: [String : Any] {
        let localizedDescription: String
        switch self {
        case .invalidPalleteExtension:
            localizedDescription = "Invalid pallete extension"
        }
        return [
            NSLocalizedDescriptionKey : localizedDescription.localized
        ]
    }
}
