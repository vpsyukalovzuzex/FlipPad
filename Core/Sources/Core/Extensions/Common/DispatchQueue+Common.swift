//
// DispatchQueue+Common.swift
//

import Foundation

extension DispatchQueue {
    
    // MARK: -
    
    static let thumbnail = DispatchQueue(label: "core.thumbnail", qos: .utility, attributes: .concurrent)
}
