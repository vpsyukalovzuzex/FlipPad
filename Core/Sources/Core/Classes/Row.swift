//
// Row.swift
//

import Foundation

public final class Row: Codable,
                        CustomStringConvertible {
    
    // MARK: -
    
    private enum Key: CodingKey {
        
        case name
    }
    
    // MARK: -
    
    public var name: String?
    
    // MARK: -
    
    public var description: String {
        return "Row name: \(String(describing: name))"
    }
    
    // MARK: -
    
    public init(name: String? = nil) {
        self.name = name
    }
    
    // MARK: -
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Key.self)
        self.name = try container.decode(String?.self, forKey: .name)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Key.self)
        try container.encode(name, forKey: .name)
    }
}
