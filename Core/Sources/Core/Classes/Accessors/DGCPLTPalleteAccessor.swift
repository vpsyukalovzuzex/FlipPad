//
// DGCPLTPalleteAccessor.swift
//

import Foundation

class DGCPLTPalleteAccessor: PalleteAccessorProtocol,
                             Codable {
    
    // MARK: -
    
    private enum Key: CodingKey {
        
        case colors
    }
    
    // MARK: -
    
    var colors: [Color]
    
    var data: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    // MARK: -
    
    init(colors: [Color]) {
        self.colors = colors
    }
    
    // MARK: -
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Key.self)
        self.colors = try container.decode([Color].self, forKey: .colors)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Key.self)
        try container.encode(colors, forKey: .colors)
    }
}
