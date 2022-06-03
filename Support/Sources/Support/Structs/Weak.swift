//
// Weak.swift
//

import Foundation

public struct Weak {
    
    // MARK: -
    
    public weak var object: AnyObject?
    
    // MARK: -
    
    public init(object: AnyObject) {
        self.object = object
    }
}
