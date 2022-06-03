//
// Resolution.swift
//

import Foundation

public struct Resolution: CustomStringConvertible {
    
    // MARK: -
    
    public static var all: [Resolution] {
        return [
            Resolution(
                width: 640,
                height: 480
            ),
            Resolution(
                width: 800,
                height: 600
            ),
            Resolution(
                width: 1280,
                height: 720
            ),
            Resolution(
                width: 1920,
                height: 1080
            )
        ]
    }
    
    // MARK: -
    
    public var width: Int
    public var height: Int
    
    // MARK: -
    
    public var description: String {
        return "\(width) x \(height)"
    }
    
    // MARK: -
    
    public init(width: Int, height: Int) {
        self.width = width
        self.height = height
    }
}
