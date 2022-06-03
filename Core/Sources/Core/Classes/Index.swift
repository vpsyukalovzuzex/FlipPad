//
// Index.swift
//

import Foundation

public final class Index: Codable,
                          Comparable,
                          CustomStringConvertible {
    
    // MARK: -
    
    private enum Key: CodingKey {
        
        case value
    }
    
    // MARK: -
    
    public static func == (lhs: Index, rhs: Index) -> Bool {
        return lhs.value == rhs.value
    }
    
    public static func < (lhs: Index, rhs: Index) -> Bool {
        return lhs.value < rhs.value
    }
    
    // MARK: -
    
    public var value: Int
    
    // MARK: -
    
    public var description: String {
        return "Index value: \(value)"
    }
    
    // MARK: -
    
    public init(value: Int) {
        self.value = value
    }
    
    // MARK: -
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Key.self)
        self.value = try container.decode(Int.self, forKey: .value)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Key.self)
        try container.encode(value, forKey: .value)
    }
}
