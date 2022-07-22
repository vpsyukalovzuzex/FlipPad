//
// URLManagerError.swift
//

import Foundation
import Support

enum URLManagerError: CustomNSError {
    
    // MARK: -
    
    case nameIsEmpty
    case namesAreSame
    
    // MARK: -
    
    static var errorDomain: String {
        return .coreErrorDomain
    }
    
    // MARK: -
    
    var errorCode: Int {
        switch self {
        case .nameIsEmpty:
            return 0
        case .namesAreSame:
            return 1
        }
    }
    
    var errorUserInfo: [String : Any] {
        let localizedDescription: String
        switch self {
        case .nameIsEmpty:
            localizedDescription = "Name is empty"
        case .namesAreSame:
            localizedDescription = "The names are the same"
        }
        return [
            NSLocalizedDescriptionKey : localizedDescription.localized
        ]
    }
}
