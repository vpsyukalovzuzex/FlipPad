//
// SettingsManager.swift
//

import Foundation
import Support

public protocol SettingsManagerDelegate: AnyObject {
    
    // MARK: -
    
    func didSetNeedsUpdateSettings()
}

public final class SettingsManager {
    
    // MARK: -
    
    private static var observers = [Weak]()
    
    // MARK: -
    
    public static func addObserver(_ observer: SettingsManagerDelegate) {
        observers.append(Weak(object: observer))
    }
    
    public static func setNeedsUpdate(sender: AnyObject? = nil) {
        observers.forEach { ($0.object as? SettingsManagerDelegate)?.didSetNeedsUpdateSettings() }
    }
}
