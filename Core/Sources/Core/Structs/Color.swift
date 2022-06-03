//
// Color.swift
//

import Foundation

// MARK: -

public typealias ColorUnitSegments = (r: Float, g: Float, b: Float, a: Float)

// MARK: -

public struct Color: Codable,
                     CustomStringConvertible {
    
    // MARK: -
    
    private enum Key: CodingKey {
        
        case r
        case g
        case b
        case a
    }
    
    // MARK: -
    
    public var r: Int
    public var g: Int
    public var b: Int
    public var a: Int
    
    public var unitSegments: ColorUnitSegments {
        return (
            Float(r) / 255.0,
            Float(g) / 255.0,
            Float(b) / 255.0,
            Float(a) / 255.0
        )
    }
    
    // MARK: -
    
    public var description: String {
        return "r: \(r), g: \(g), b: \(b), a: \(a)"
    }
    
    // MARK: -
    
    public init(
        r: Int,
        g: Int,
        b: Int,
        a: Int
    ) {
        self.r = r
        self.g = g
        self.b = b
        self.a = a
    }
    
    // MARK: -
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Key.self)
        self.r = try container.decode(Int.self, forKey: .r)
        self.g = try container.decode(Int.self, forKey: .g)
        self.b = try container.decode(Int.self, forKey: .b)
        self.a = try container.decode(Int.self, forKey: .a)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Key.self)
        try container.encode(r, forKey: .r)
        try container.encode(g, forKey: .g)
        try container.encode(b, forKey: .b)
        try container.encode(a, forKey: .a)
    }
}
