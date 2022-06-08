//
// Settings.swift
//

import Foundation
import Support

public class Settings {
    
    // MARK: -
    
    @Store("fps", 24)
    public static var fps: Int
    
    @Store("resolution", 0)
    public static var resolution: Int
}
