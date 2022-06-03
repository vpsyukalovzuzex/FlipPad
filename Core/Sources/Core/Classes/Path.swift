//
// Path.swift
//

import Foundation

public final class Path: Codable,
                         Comparable,
                         CustomStringConvertible {
    
    // MARK: -
    
    private enum Key: CodingKey {
        
        case x
        case y
    }
    
    // MARK: -
    
    public static var zero: Path {
        return Path()
    }
    
    // MARK: -
    
    public static func < (lhs: Path, rhs: Path) -> Bool {
        if lhs.y == rhs.y {
            return lhs.x < rhs.x
        }
        return lhs.y < rhs.y
    }
    
    public static func == (lhs: Path, rhs: Path) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
    
    // MARK: -
    
    public var x: Int
    public var y: Int
    
    // MARK: -
    
    public var description: String {
        return "Path x: \(x), y: \(y)"
    }
    
    // MARK: -
    
    init(x: Int = 0, y: Int = 0) {
        self.x = x
        self.y = y
    }
    
    // MARK: -
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Key.self)
        self.x = try container.decode(Int.self, forKey: .x)
        self.y = try container.decode(Int.self, forKey: .y)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Key.self)
        try container.encode(x, forKey: .x)
        try container.encode(y, forKey: .y)
    }
}
