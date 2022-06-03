//
// PalletesManager.swift
//

import Foundation
import Support

public protocol PalletesManagerDelegate: AnyObject {
    
    // MARK: -
    
    func didSetNeedsUpdatePalletes()
}

public final class PalletesManager {
    
    // MARK: -
    
    private static var observers = [Weak]()
    
    // MARK: -
    
    public static func addObserver(_ observer: PalletesManagerDelegate) {
        observers.append(Weak(object: observer))
    }
    
    public static func setNeedsUpdate() {
        observers.forEach { ($0.object as? PalletesManagerDelegate)?.didSetNeedsUpdatePalletes() }
    }
    
    public static func pallete(with name: String) -> Pallete? {
        guard let url = URLManager.palletesUrls.filter({ $0.deletingPathExtension().lastPathComponent == name }).first else {
            return nil
        }
        return try? Pallete(url: url)
    }
}
