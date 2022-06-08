//
// AccessorFactoryError.swift
//

import Foundation
import Support

public enum AccessorFactoryError: CustomNSError {
    
    // MARK: -
    
    case invalidFileExtension
    
    // MARK: -
    
    public static var errorDomain: String {
        return .coreErrorDomain
    }
    
    // MARK: -
    
    public var errorCode: Int {
        switch self {
        case .invalidFileExtension:
            return 0
        }
    }
    
    public var errorUserInfo: [String : Any] {
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
