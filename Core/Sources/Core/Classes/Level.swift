//
// Level.swift
//

import Foundation

public final class Level: Codable,
                          CustomStringConvertible {
    
    // MARK: -
    
    public enum Kind: Int {
        
        case sound = 0
        case background
        case foreground
        
        // MARK: -
        
        public init(rawValue: Int) {
            switch rawValue {
            case 0:
                self = .sound
            case 1:
                self = .background
            case 2:
                self = .foreground
            default:
                self = .foreground
            }
        }
    }
    
    // MARK: -
    
    private enum Key: CodingKey {
        
        case kind
        case name
        case isLocked
        case isHidden
    }
    
    // MARK: -
    
    public var kind: Kind
    
    public var name: String?
    
    public var isLocked: Bool
    public var isHidden: Bool
    
    // MARK: -
    
    public var description: String {
        return "Level kind: \(kind), name: \(String(describing: name)), isLocked: \(isLocked), isHidden: \(isHidden)"
    }
    
    // MARK: -
    
    public init(
        kind: Kind = .foreground,
        name: String? = nil,
        isLocked: Bool = false,
        isHidden: Bool = false
    ) {
        self.kind = kind
        self.name = name
        self.isLocked = isLocked
        self.isHidden = isHidden
    }
    
    // MARK: -
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Key.self)
        self.kind = Kind(rawValue: try container.decode(Int.self, forKey: .kind))
        self.name = try container.decode(String?.self, forKey: .name)
        self.isLocked = try container.decode(Bool.self, forKey: .isLocked)
        self.isHidden = try container.decode(Bool.self, forKey: .isHidden)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Key.self)
        try container.encode(kind.rawValue, forKey: .kind)
        try container.encode(name, forKey: .name)
        try container.encode(isLocked, forKey: .isLocked)
        try container.encode(isHidden, forKey: .isHidden)
    }
}
