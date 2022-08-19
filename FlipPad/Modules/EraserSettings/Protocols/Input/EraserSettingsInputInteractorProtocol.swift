//
// EraserSettingsInputInteractorProtocol.swift
//

import Foundation

protocol EraserSettingsInputInteractorProtocol: AnyObject {
    
    // MARK: -
    
    func start()
    
    func setSize(_ size: Int)
    
    func setHardness(_ hardness: Int)
}
